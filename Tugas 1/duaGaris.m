%% Soal #8
figure(1);
t = 0: 0.1: 2*pi; 
y1 = sin(t);
y2 = cos(t);
plot(t, y1, 'b');
hold on
plot(t, y2, 'r--');
hold off
xlabel("Waktu (s)");
ylabel("Nilai Fungsi");
title("Fungsi Sin dan Cos terhadap Waktu");
legend("sin", "cos")
xlim([0 2*pi])
ylim([-1.4 1.4])