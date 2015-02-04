function [framerate,vidWidth,vidHeight,nFrames]=processVideo(filename)
    vid = VideoReader(filename);
    framerate=get(vid, 'FrameRate')
    vidWidth = vid.Width;
    vidHeight = vid.Height;
    nFrames=vid.NumberOfFrames;
    i=1;
    for k = 1 : framerate/2 : 100
        mov(i).cdata = read(vid,k);
        i=i+1;    
    end
    
