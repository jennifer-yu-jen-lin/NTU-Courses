clear;
clc;

[numA1,txtA1] = xlsread('allgroup_NormA_grade1.xlsx') ;
[numA2,txtA2] = xlsread('allgroup_NormA_grade2.xlsx') ;
[numE1,txtE1] = xlsread('allgroup_NormE_grade1.xlsx') ;
[numE2,txtE2] = xlsread('allgroup_NormE_grade2.xlsx') ;
[numS1,txtS1] = xlsread('allgroup_NormS_grade1.xlsx') ;
[numS2,txtS2] = xlsread('allgroup_NormS_grade2.xlsx') ;
[numP1,txtP1] = xlsread('allgroup_NormP_grade1.xlsx') ;
[numP2,txtP2] = xlsread('allgroup_NormP_grade2.xlsx') ;

ID1 = num2cell(numA1(:,1));
ID2 = num2cell(numA2(:,1));
ID = [ID1;ID2];

numA1(:,1) = [];
numA2(:,1) = [];
numE1(:,1) = [];
numE2(:,1) = [];
numS1(:,1) = [];
numS2(:,1) = [];
numP1(:,1) = [];
numP2(:,1) = [];

meanA1 = mean(numA1,2);
meanA2 = mean(numA2,2);
meanE1 = mean(numE1,2);
meanE2 = mean(numE2,2);
meanS1 = mean(numS1,2);
meanS2 = mean(numS2,2);
meanP1 = mean(numP1,2);
meanP2 = mean(numP2,2);

result = [meanS1, meanA1, meanP1, meanE1 ; meanS2, meanA2, meanP2, meanE2];
result_cell = num2cell(result);
ID_result_cell = [ID, result_cell];

colnames = {'½s¸¹', 'NormS', 'NormA', 'NormP','NormE'};
final = [colnames;ID_result_cell];

xlswrite('HW6_1.xlsx', final)
