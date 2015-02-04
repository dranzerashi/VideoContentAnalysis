%% video Database XML
docNode = com.mathworks.xml.XMLUtils.createDocument('VideoDataBase');
vdb=docNode.getDocumentElement;
vdb.setAttribute('version','1.0');
vdb.setAttribute('count','0');
%video = docNode.createElement('video');
%video.setAttribute('Id',VideoID);
%video.appendChild(docNode.createTextNode(FileName));
%vdb.appendChild(video);
xmlwrite('videoindex.xml',docNode);
type('videoindex.xml');

%% Classifier XML
docNode = com.mathworks.xml.XMLUtils.createDocument('ClassifierList');
vdb=docNode.getDocumentElement;
vdb.setAttribute('version','1.0');
vdb.setAttribute('count','0');
xmlwrite('classifierlist.xml',docNode);

%%
