clc;
% str = 'This is a     simp...le exa.mple . - ) *';
DirPath='C:\Users\Mudabir Ahmad\Desktop\k\ExtraCuricular\';
DirFiles=dir (DirPath);
match=0;
final=[];
[numeric,strings] = xlsread('C:\Users\Mudabir Ahmad\Desktop\k\extractedkeywords.xlsx');
strings=upper(strings)
f=1;
for FNo=3:length(DirFiles);
    File=strcat(DirPath,DirFiles(FNo).name);
    disp(DirFiles(FNo).name);
   
    str= fileread(File);
    str = strsplit(str,' ')

sizeOfstr = size(str,2);
empty = 1;
Bad = '! # $ @ $ % ^ & * ( ) _ - + = \ | ] [ } { " : ; ? / > < . , ' ;
Bad = strsplit(Bad,' ');
sizeOfbad = size(Bad,2);

for i = 1:sizeOfbad
    start = 1;
    End = sizeOfstr;
    splitAt = char(Bad(1,i))
    
    for j = 1:sizeOfstr
        index = j;
        Val = char(str(1,index));
        spVal = strsplit(Val,splitAt);%-------------
        for k = 1:size(spVal,2);
             if(strcmp(spVal(1,k),'')==1)
%                  disp('In if found empty cell');
%                  empty=empty+1;
%                 sb1 = spVal(1:k-1);
%                 sb2 = spVal(k+1:end);
%                 spVal = cat(2,st,spVal);
%                 k = k-1;
             else
                str = cat(2,str,spVal(1,k));
            end
        end
%         newMatrix = cat(2,newMatrix,spVal);

    end
    
    str = str(End+1:end);
   
   %     str = newMatrix
    sizeOfstr = size(str,2)
    str=upper(str);
   
end

 for keywordstrings=1:size(strings,2);
         keyWord=strings(1,keywordstrings);
         for wordCompare=1:size(str,2);
            fileword=str(1,wordCompare);
            if(strcmp(keyWord,fileword)==1)
                 match=match+1;
            end 
         end
          
            Frequency=match/sizeOfstr;
            match1=match;
            final(FNo,keywordstrings)=Frequency;
            match=0;
 end
        
end
 

filename = 'C:\Users\Mudabir Ahmad\Desktop\k\datasetextracted.xlsx';
xlswrite(filename,final);