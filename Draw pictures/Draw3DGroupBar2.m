function Draw3DGroupBar2

Q1 = [7	7	7	7	7	8	9	10	11	12	12	12	12	14	14	14	14	14	14	14	14
6	6	6	6	7	8	9	10	11	11	11	11	13	13	13	13	13	13	13	13	13
5	5	5	6	7	8	9	10	10	10	10	10	12	12	12	12	12	12	12	12	12
4	4	5	6	7	8	9	9	9	9	9	9	11	11	11	11	11	11	11	11	11
3	4	5	6	7	8	8	8	8	10	10	10	10	10	10	10	10	10	10	10	10
3	4	5	6	7	7	7	7	9	9	9	9	9	9	9	9	9	9	9	9	9
3	4	5	6	6	6	6	8	8	8	8	8	8	8	8	8	8	8	8	8	8
3	4	5	5	5	5	7	7	7	7	7	7	7	7	7	7	7	7	7	7	7
3	4	4	4	4	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6
3	3	3	3	5	5	5	5	5	5	5	5	5	5	5	5	5	5	5	5	5
2	2	2	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4
1	1	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3
0	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
];

Q2 = [8	8	8	8	8	7	6	5	4	3	3	3	2	1	0	0	0	0	0	0	0
9	9	9	9	8	7	6	5	4	4	4	3	2	1	0	0	0	0	0	0	0
10	10	10	9	8	7	6	5	5	5	4	3	2	1	0	0	0	0	0	0	0
11	11	10	9	8	7	6	6	6	5	4	3	2	1	0	0	0	0	0	0	0
12	11	10	9	8	7	7	7	6	5	4	3	2	1	0	0	0	0	0	0	0
12	11	10	9	8	8	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
12	11	10	9	9	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
12	11	10	10	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
12	11	11	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
12	12	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
13	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
14	13	12	11	10	9	8	7	6	5	4	3	2	1	0	0	0	0	0	0	0
];



close all
%at x=1
y1=Q1;
%at x=2
y2=Q2;
figure(1); 
hold on;
%First x value
xval = 1; 
h = bar3(y1,'grouped');
Xdat = get(h,'Xdata');
for ii=1:length(Xdat)
    Xdat{ii}=Xdat{ii}+(xval-1)*ones(size(Xdat{ii}));
    set(h(ii),'XData',Xdat{ii});
end
%Second x value
xval = 2;
h = bar3(y2,'grouped');
Xdat = get(h,'Xdata');
for ii=1:length(Xdat)
    Xdat{ii}=Xdat{ii}+(xval-1)*ones(size(Xdat{ii}));
    set(h(ii),'XData',Xdat{ii});
end
%xlim([0 3]);
view(3);
title('Grouped Style')
xlabel('x');
ylabel('y');
zlabel('z');
end