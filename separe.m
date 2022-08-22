%% Programme pour faire la separation entre SB,SG,LCR d'une image segmenter
clc;
close all;
clear all;

%l'image a separe 
V = niftiread('t1_002c_mask_seg.nii');


SB= zeros(size(V));
SG= zeros(size(V));
LCS= zeros(size(V));

% substance blanche

for i=1:size(V,1)
    for j=1:size(V,2)
        for k=1:size(V,3)
            if (V(i,j,k)==3)
            SB(i,j,k)= 1 ;
            else
                SB(i,j,k)= 0 ;
            end
        end
    end
end

% substance grise

for i=1:size(V,1)
    for j=1:size(V,2)
        for k=1:size(V,3)
            if (V(i,j,k)==2)
            SG(i,j,k)= 1 ;
            else
                SG(i,j,k)= 0 ;
            end
        end
    end
end

%LCS

for i=1:size(V,1)
    for j=1:size(V,2)
        for k=1:size(V,3)
            if (V(i,j,k)==1)
            LCS(i,j,k)= 1 ;
            else
                LCS(i,j,k)= 0 ;
            end
        end
    end
end

% l'ecriture des images nifti
niftiwrite(SB,'t1_002c_mask_seg_SB.nii');
niftiwrite(SG,'t1_002c_mask_seg_SG.nii');
niftiwrite(LCS,'t1_002c_mask_seg_LCS.nii');