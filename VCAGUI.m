function varargout = VCAGUI(varargin)
% VCAGUI MATLAB code for VCAGUI.fig
%      VCAGUI, by itself, creates a new VCAGUI or raises the existing
%      singleton*.
%
%      H = VCAGUI returns the handle to a new VCAGUI or the handle to
%      the existing singleton*.
%
%      VCAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VCAGUI.M with the given input arguments.
%
%      VCAGUI('Property','Value',...) creates a new VCAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VCAGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VCAGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VCAGUI

% Last Modified by GUIDE v2.5 03-Feb-2015 20:23:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VCAGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @VCAGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

end

% --- Executes just before VCAGUI is made visible.
function VCAGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VCAGUI (see VARARGIN)

% Choose default command line output for VCAGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VCAGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

end

% --- Outputs from this function are returned to the command line.
function varargout = VCAGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end

function Title_Callback(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Title as text
%        str2double(get(hObject,'String')) returns contents of Title as a double

end

% --- Executes during object creation, after setting all properties.
function Title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

% --- Executes on button press in queryselect.
function queryselect_Callback(hObject, eventdata, handles)
% hObject    handle to queryselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   [file,path]=uigetfile('','Add Files','');
end

% --- Executes on button press in uploadselect.
function uploadselect_Callback(hObject, eventdata, handles)
% hObject    handle to uploadselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [file,path]=uigetfile('','Add Files','');
    if length(file)>1
        sourcefullpath=[path,file];
        fullpath=strrep(sourcefullpath, '\', '/');
        destination='C:/Users/Student/Documents/MATLAB/VideoContentAnalysis/videodatabase/';
        [status,message]= copyfile( fullpath , destination);
        oldname=strcat(destination,file)
        title=get(handles.Title,'String');
        count=addToVideoDataBase(title)
        newname=[destination,num2str(count),'.m']
        movefile(oldname,newname);
    end
end
