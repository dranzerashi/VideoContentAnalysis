function [count] = addToVideoDataBase(filename)
    try
        xDoc = xmlread(fullfile('videoindex.xml'));
    catch
         error('Failed to read XML file videoindex.xml');
    end
    xRoot = xDoc.getDocumentElement;
    theAttributes = xRoot.getAttributes;
    count= str2num(theAttributes.item(0).getValue());
    count=count+1
    video = xDoc.createElement('video');
    video.setAttribute('Id',num2str(count));
    video.appendChild(xDoc.createTextNode(filename));
    xRoot.appendChild(video);
    xRoot.setAttribute('count',num2str(count));
    xmlwrite('videoindex.xml',xDoc);
end
