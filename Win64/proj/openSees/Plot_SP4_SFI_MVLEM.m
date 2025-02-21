close all
clc
clear all

load Test.txt

Foldername = 'SFI_MVLEM_SP4';

LoadDef = load(fullfile(Foldername,'MVLEM_Dtop.out'));
Dsh = load(fullfile(Foldername,'MVLEM_Dsh.out'));

Panel_strain = load(fullfile(Foldername,'MVLEM_panel_strain.out'));
Panel_stress = load(fullfile(Foldername,'MVLEM_panel_stress.out'));
Panel_stress_concrete = load(fullfile(Foldername,'MVLEM_panel_stress_concrete.out'));
Panel_stress_steel = load(fullfile(Foldername,'MVLEM_panel_stress_steel.out'));
Strain_stress_concrete1 = load(fullfile(Foldername,'MVLEM_strain_stress_concrete1.out'));
Strain_stress_concrete2 = load(fullfile(Foldername,'MVLEM_strain_stress_concrete2.out'));

[timesize,ElPlusOne] = size(Dsh);

for j = 1:timesize
    DshTop(j,1) = sum(Dsh(j,2:ElPlusOne));
end

figure(1)
subplot(1,3,1)
plot(Test(:,1),Test(:,2),'r')
hold on
plot(LoadDef(:,2),LoadDef(:,1),'b')
axis([-2.5 2.5 -250 250])
hold off
subplot(1,3,2)
plot(Test(:,4),Test(:,2),'r')
hold on
plot(DshTop,LoadDef(:,1),'b')
axis([-2.5 2.5 -250 250])
hold off
subplot(1,3,3)
plot(Test(:,3),Test(:,2),'r')
hold on
plot(LoadDef(:,2)-DshTop,LoadDef(:,1),'b')
axis([-2.5 2.5 -250 250])
hold off

figure(2)
subplot(1,2,1)
plot(Strain_stress_concrete1(:,2),Strain_stress_concrete1(:,3),'r')
subplot(1,2,2)
plot(Strain_stress_concrete2(:,2),Strain_stress_concrete2(:,3),'r')
