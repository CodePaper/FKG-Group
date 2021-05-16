

function [X1]=MAIN(Database)

clc;

fprintf('===============================================\n');
fprintf('  Loading variance train... \n');
fprintf('===============================================\n');
addpath('..\input');
Databasegoc = load(['..\input\' Database]);
% [a10 b10]=size(Databasegoc1);
% Databasegoc2=Databasegoc1(:,2:b10);
% Databasegoc3=Databasegoc1(:,1);
% % for i=1:a10
% %     if Databasegoc3(i,1)==3
% %         Databasegoc3(i,1)=0;
% %     else
% %         Databasegoc3(i,1)=1;
% %     end
% % end
%         
% Databasegoc=[Databasegoc2, Databasegoc3];
[a,b]=size(Databasegoc);
j=1;
t=1;

Databasegoc(1:10,:);
for i=1:a
    if Databasegoc(i,b)==0
        label0(j,:)=Databasegoc(i,:);
        j=j+1;
    else  
        label1(t,:)=Databasegoc(i,:);
        t=t+1;
    end
end
[a1,b1]=size(label0);
[a2,b2]=size(label1);
Train1=label0(1:round(a1*0.7),:);
Train2=label1(1:round(a2*0.7),:);
Train=[Train1;Train2];
Test1=label0(round(a1*0.3)+1:a1,:);
Test2=label1(round(a2*0.3)+1:a2,:);
Test=[Test1;Test2];

[X1 A B cluster center_vector] = Make2(Train);
[Accuracy Recall Precision Time] = TestGraph2(Test,A,B,X1,cluster,center_vector)






% 
% output_file = strrep('Database_Breast_output','.txt','_output');
% addpath('..\output')
% save(['..\output\' output_file], 'Time');
% save(['..\output\' output_file], 'Accuracy', '-append');
% save(['..\output\' output_file], 'Recall', '-append');
% save(['..\output\' output_file], 'Precision', '-append');


