function [ output,average ] = excludeoutlier( origin )
%EXCLUDEOUTLIER �˴���ʾ�йش˺�����ժҪ
%   ����ȥ������origin�е�outliers
%   outputΪ�������Ч���ݣ�mΪ��Ч���ݵ�ƽ��ֵ
[m,n] = size(origin);
output =zeros(m,n);
average=zeros(m,1);
for i=1:m
    v = origin(i,:);
    while 1
        flag = (v~=0);
        ave = mean(v(v~=0));
        std1 = std(v(v~=0));
        temp = (abs(v-ave) <= 1.5*std1);
        temp = temp.*flag;
        v = v.*temp;
        if flag ==temp
            break
        end
    end
    output(i,:)=v;
    average(i,1)=mean(v(v~=0));
end
end

