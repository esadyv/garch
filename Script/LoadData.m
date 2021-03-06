% 加载计算结果数据文件
% flag 加载成功与否标记，1：成功；0：失败
function [Data,Data2,flag] = LoadData(model,type,name,weightCount,YC)

try  
    flag=1;
    Data=[];
    Data2=[];
    if isempty(YC)
        if(weightCount==1)
           tempData=load(strcat('../Result/',name,'_',type,'.mat'));       
           Data=eval(strcat('[tempData.',model,'_Result1];'));     
        elseif(weightCount==2)
           tempData=load(strcat('../Result/',name,'_',type,'_Defensive.mat'));
           Data=eval(strcat('[tempData.',model,'_Result1];'));
           tempData2=load(strcat('../Result/',name,'_',type,'_Offensive.mat'));
           Data2=eval(strcat('[tempData2.',model,'_Result2];'));
        end
    else
        if(weightCount==1)
           tempData=load(strcat('../Result/',name,'_',type,'_',num2str(YC),'.mat'));       
           Data=eval(strcat('[tempData.',model,'_Result1];'));     
        elseif(weightCount==2)
           tempData=load(strcat('../Result/',name,'_',type,'_',num2str(YC),'_Defensive.mat'));
           Data=eval(strcat('[tempData.',model,'_Result1];'));
           tempData2=load(strcat('../Result/',name,'_',type,'_',num2str(YC),'_Offensive.mat'));
           Data2=eval(strcat('[tempData2.',model,'_Result2];'));
        end
    end
catch ME
    %error('文件不存在!');
    flag=0;
end
Data=real(Data);
Data2=real(Data2);