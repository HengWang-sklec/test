%written by Xiangyu li(02042015)
clear;

kmax=9;             %%modify here
type='1A';          %%modify here

%%
for k=0:kmax
    infile=['T' num2str(k) '-' type];
    if ~exist([infile '_z.grid'],'file')
        data=prepcoredata(infile,0.005);
        clear data;
    end
end

%%
fid1=fopen([type '_Volume.dat'],'wt');
for k=0:kmax
   str0=['T'  num2str(k)];
   fprintf(fid1,'%12s',str0);
end
fprintf(fid1,'\n');

fid2=fopen([type '_VolumeLoss.dat'],'wt');
for k=0:kmax
   str0=['T'  num2str(k) '-T0'];
   fprintf(fid2,'%12s',str0);
end
fprintf(fid2,'\n');

%%
for k=0:kmax
    infile=['T' num2str(k) '-' type];
    Volumeloss = comparecores(infile,['T0-' type]);
    V=VolumeCal(infile);

    fprintf(fid1,'%12.4f',V);
    fprintf(fid2,'%12.4f',Volumeloss);
end

fprintf(fid1,'\n');
fprintf(fid2,'\n');
fclose(fid1);
fclose(fid2);
