function saveImage(image, folder, title_name)
% This function saves the image in a standardized way. Note that 
% all images will be saved in 'img' folder of the project.
% image     : the image matrix
% folder    : the name of the folder
% title_name: the name of the file
    title_name = title_name.replace(".jpg", ""); % remove .jpg
    title_name = regexprep(title_name,'(\<[a-z])','${upper($1)}'); % capitalize
    file_name = lower(title_name.replace(" ", "_")); % replace spaces with _
    file_name = file_name.replace(".", "_"); % remove .
    figure();
    imshow(image);
    title(title_name);
    saveas(gcf,'img/'+folder+'/'+file_name+'.jpg')
    close gcf;
end
