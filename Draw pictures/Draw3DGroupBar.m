function Draw3DGroupBar
% Set up two random data sets

clear;
close all;

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


data1 = Q1;
data2 = Q2;

% plot the first data set

bh1 = bar3(data1);

% Loop through each row and shift bars upwards

for i=1:length(bh1)
      zz = get(bh1(i),'Zdata');
      k = 1;

      % Bars are defined by 6 faces(?), adding values from data2 will
      % shift the bars upwards accordingly, I'm sure this could be made
      % better!
      for j = 0:6:(6*length(bh1)-6)  
             zz(j+1:j+6,:)=zz(j+1:j+6,:)+data2(k,i);
             k=k+1;
      end

      % Reset Zdata in chart
      set(bh1(i),'Zdata',zz);
end

% Set face colour to red for data1

set(bh1,'FaceColor',[1 0 0]);

% Apply hold so that data2 can be plotted

hold on;

% Plot data2
bh2=bar3(data2);

% Set face color to blue

set(bh2,'FaceColor',[0 1 0]);

xlabel('x2');
ylabel('x1');

set(gca,'XTick', 0:5:20)
set(gca,'YTick', 0:5:20)
xlim([0, 20]);
xlim([0, 20]);
legend([bh1(1), bh2(1)], {'Q_1^\ast', 'Q_2^\ast'});

hold off;
end