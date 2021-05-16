
function [Accuracy Recall Precision Time] = TestGraph3(Test,A,B,X1,cluster,center_vector)
% var_data = [train_data(:,1) var_data];
eta=0.000001;
[Test_num test_attribute_num] = size(Test);
datatest=Test(:,1:test_attribute_num-1);
nhantest=Test(:,test_attribute_num);

start_time_train = cputime;
for j=1:test_attribute_num-1
    w=center_vector{j};
    for i=1:Test_num
        for l=1:cluster(j)
            d(l)=1000;
            d(l)=datatest(i,j)-w(l);
        end
        dmin=min(d);
        for l=1:cluster(j)
            if d(l)==dmin
                X2(i,j)=l;
            end
        end
    end
end
T=X2
T=X1
% T=temp;

%  [a,b]=size(V);
% T=[2 1 1;1 3 3;3 2 1;3 1 2;1 3 2;2 3 3];
ruleList1=X1;
te=T;
%  nhan1=[1 2 1 1 2 2];
% te=ruleList1(:,1:9);
size(A);
size(B);
% nhan1=ruleList1(:,10)';
[a1,a2]=size(te);
[r1,r2]=size(ruleList1);
ruleList1;

%Tính C
for i=1: a1
    j=1;
    for l=1:r2-3
        for h=l+1:r2-2
            for s=h+1:r2-1
                dem1=0;
                dem2=0;
                for t=1:r1
                    if (te(i,l)==ruleList1(t,l))&(te(i,h)==ruleList1(t,h))&(te(i,s)==ruleList1(t,s))
                        if (ruleList1(t,r2)==1)
                            dem1=dem1+B(t,j);
                        else
                            dem2=dem2+B(t,j);
                        end
                    end
                end
                C1(i,j)=dem1;
                C2(i,j)=dem2;
                j=j+1;
            end
        end
    end
end
C1
C2
% for j=1:a2
%      for k=1:a1
%             tong=0;
%             for t=1:b1
%                 if (te(k,j)==ruleList1(t,j))&(ruleList1(t,b2)==0)
%                     tong=tong+B(t,j);
%                 end
%             end
%             C1(k,j)=tong;
%     end
% end
% C1;
% 
 minC1=min(C1');
 maxC1=max(C1');
 
D1=minC1+maxC1;

% D1=minC1;
% for j=1:a2
%      for k=1:a1
%             tong=0;
%             for t=1:b1
%                 if (te(k,j)==ruleList1(t,j))&(ruleList1(t,b2)==1)
%                     tong=tong+B(t,j);
%                 end
%             end
%             C2(k,j)=tong;
%     end
% end

minC2=min(C2');
maxC2=max(C2');
D2=minC2+maxC2;
% D2=minC2
for k=1:a1
    if D1(k)>D2(k)
        nhan(k)=1;
    else
        nhan(k)=2;
    end
end

end_time_train = cputime;
Time =end_time_train - start_time_train;
nhan
temp=nhan;
train_output=nhantest+1;
TN=0;
TP=0;
FN=0;
FP=0;
for i=1:size(temp')
    if (temp(i)==train_output(i))& (temp(i)==1)
        TP=TP+1;
    end
    if (temp(i)==train_output(i))& (temp(i)==2)
        TN=TN+1;
    end
    if (train_output(i)==1)& (temp(i)==2)
        FN=FN+1;
    end
    if (train_output(i)==2)& (temp(i)==1)
        FP=FP+1;
    end
end

Accuracy=(TN+TP)/(TN+TP+FN+FP);

Recall=TP/(TP+FN);

Precision=TP/(TP+FP);




