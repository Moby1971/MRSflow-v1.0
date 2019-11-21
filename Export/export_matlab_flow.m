function export_matlab_flow(directory,velim,modim,difim,mask,tag)

% create folder if not exist, and clear

folder_name = [directory,[filesep,'Flow_',tag]];
if (~exist(folder_name, 'dir')); mkdir(folder_name); end
delete([folder_name,filesep,'*']);

% export the  images

image = velim;
fname = [folder_name,filesep,'Velocity'];
save(fname,'image');

image = modim.*mask;
fname = [folder_name,filesep,'Modulus'];
save(fname,'image');

image = difim.*mask;
fname = [folder_name,filesep,'Diffimage'];
save(fname,'image');

end