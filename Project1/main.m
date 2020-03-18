function main = main()

%Question 2(A): 2D-Gaussian
ga1 = make2DGaussian(31, 10);
ga2 = make2DGaussian(21, 5);
figure(1),
subplot(2,1,1); surf(ga1); title('Gaussian(N=31, Sigma=10)')
subplot(2,1,2); surf(ga2); title('Gaussian(N=21, Sigma=5)')

%Question 2(B): 2D-LaplacianOfGaussian
gb1 = make2DLOG(25, 5);
gb2 = make2DLOG(15, 2.5);
figure(2),
subplot(2,1,1); surf(gb1); title('LOG(N=25, Sigma=5)')
subplot(2,1,2); surf(gb2); title('LOG(N=15, Sigma=2.5)')

%Question 2(C): 2D-Gabor
[geven1, godd1] = make2DGabor(15, 2, 75);
[geven2, godd2] = make2DGabor(20, 3, 135);
[geven3, godd3] = make2DGabor(25, 2.5, 0);
figure(3),
subplot (3,2,1); surf(geven1); title('Gabor(N=15, Lambda=2, Angle=75) - even')
subplot (3,2,2); surf(godd1); title('Gabor(N=15, Lambda=2, Angle=75) - odd')
subplot (3,2,3); surf(geven2); title('Gabor(N=20, Lambda=3, Angle=135) - even')
subplot (3,2,4); surf(godd2); title('Gabor(N=20, Lambda=3, Angle=135) - odd')
subplot (3,2,5); surf(geven3); title('Gabor(N=25, Lambda=2.5, Angle=0) - even')
subplot (3,2,6); surf(godd3); title('Gabor(N=25, Lambda=2.5, Angle=0) - odd')

%Question 3:
orgpaolina = imread('Paolina.jpg');
orgpiano = imread('Piano.jpg');
paolina = rgb2gray(orgpaolina);
piano = rgb2gray(orgpiano);

% %Question 3(A): convolution of LOG with image
% log3a = make2DLOG(500, 2.8);
% paolina3a = convIMG(paolina, log3a);
% piano3a = convIMG(piano, log3a);
% figure(4),
% subplot(2,2,1); imshow(orgpaolina,[]); title('paolina.jpg')
% subplot(2,2,2); imshow(paolina3a,[]); title('(Applied LOG) paolina.jpg')
% subplot(2,2,3); imshow(orgpiano,[]); title('piano.jpg')
% subplot(2,2,4); imshow(piano3a,[]); title('(Applied LOG) piano.jpg')
% 
% %Question 3(B): compute zero-crossings with LOG
% zc28paolina = zeroCrossingLOG(orgpaolina, 500, 2.8);
% zc48paolina = zeroCrossingLOG(orgpaolina, 500, 4.8);
% zc68paolina = zeroCrossingLOG(orgpaolina, 500, 6.8);
% log28paolina = convIMG(paolina, make2DLOG(500, 2.8));
% log48paolina = convIMG(paolina, make2DLOG(500, 4.8));
% log68paolina = convIMG(paolina, make2DLOG(500, 6.8));
% figure(5),
% subplot(4,2,[1,2]); imshow(orgpaolina,[]); title('paolina (original).jpg')
% subplot(4,2,3); imshow(zc28paolina,[]); title('paolina zero-crossing (sigma 2.8).jpg')
% subplot(4,2,4); imshow(log28paolina,[]); title('paolina (Applied LOG sigma 2.8).jpg')
% subplot(4,2,5); imshow(zc48paolina,[]); title('paolina zero-crossing (sigma 4.8).jpg')
% subplot(4,2,6); imshow(log48paolina,[]); title('paolina (Applied LOG sigma 4.8).jpg')
% subplot(4,2,7); imshow(zc68paolina,[]); title('paolina zero-crossing (sigma 6.8).jpg')
% subplot(4,2,8); imshow(log68paolina,[]); title('paolina (Applied LOG sigma 6.8).jpg')
% 
% zc28piano = zeroCrossingLOG(orgpiano, 500, 2.8);
% zc48piano = zeroCrossingLOG(orgpiano, 500, 4.8);
% zc68piano = zeroCrossingLOG(orgpiano, 500, 6.8);
% log28piano = convIMG(piano, make2DLOG(500, 2.8));
% log48piano = convIMG(piano, make2DLOG(500, 4.8));
% log68piano = convIMG(piano, make2DLOG(500, 6.8));
% figure(6),
% subplot(4,2,[1,2]); imshow(orgpiano,[]); title('piano (original).jpg')
% subplot(4,2,3); imshow(zc28piano,[]); title('piano zero-crossing (sigma 2.8).jpg')
% subplot(4,2,4); imshow(log28piano,[]); title('piano (Applied LOG sigma 2.8).jpg')
% subplot(4,2,5); imshow(zc48piano,[]); title('piano zero-crossing (sigma 4.8).jpg')
% subplot(4,2,6); imshow(log48piano,[]); title('piano (Applied LOG sigma 4.8).jpg')
% subplot(4,2,7); imshow(zc68piano,[]); title('piano zero-crossing (sigma 6.8).jpg')
% subplot(4,2,8); imshow(log68piano,[]); title('piano (Applied LOG sigma 6.8).jpg')

% Question 3(D): compute zero-crossings with Gabor

% Small sigma=4.8
[esmall0, osmall0] = make2DGabor(300, 4.8, 0);
[esmall45, osmall45] = make2DGabor(300, 4.8, 45);
[esmall90, osmall90] = make2DGabor(300, 4.8, 90);

% Big sigma=28,48,68
[e280, o280] = make2DGabor(500, 28, 0);
[e2845, o2845] = make2DGabor(500, 28, 45);
[e2890, o2890] = make2DGabor(500, 28, 90);
[e480, o480] = make2DGabor(500, 48, 0);
[e4845, o4845] = make2DGabor(500, 48, 45);
[e4890, o4890] = make2DGabor(500, 48, 90);
[e680, o680] = make2DGabor(500, 68, 0);
[e6845, o6845] = make2DGabor(500, 68, 45);
[e6890, o6890] = make2DGabor(500, 68, 90);

% %-----------------------------piano----------------------------------------
% % BIG sigma Zero-Crossing
% zcG28piano = zeroCrossingGabor(orgpiano, 500, 28);
% zcG48piano = zeroCrossingGabor(orgpiano, 500, 48);
% zcG68piano = zeroCrossingGabor(orgpiano, 500, 68);
% G28piano = convIMG(piano, o2845);
% G48piano = convIMG(piano, o4845);
% G68piano = convIMG(piano, o6845);
% figure(8),
% subplot(4,2,[1,2]); imshow(orgpiano,[]); title('piano (original).jpg')
% subplot(4,2,3); imshow(zcG28piano,[]); title('piano zero-crossing (3 angles, sigma 28).jpg')
% subplot(4,2,4); imshow(G28piano,[]); title('piano (Applied Odd Gabor sigma 28, angle 45).jpg')
% subplot(4,2,5); imshow(zcG48piano,[]); title('piano zero-crossing (3 angles, sigma 48).jpg')
% subplot(4,2,6); imshow(G48piano,[]); title('piano (Applied Odd Gabor sigma 48, angle 45).jpg')
% subplot(4,2,7); imshow(zcG68piano,[]); title('piano zero-crossing (3 angles, sigma 68).jpg')
% subplot(4,2,8); imshow(G68piano,[]); title('piano (Applied Odd Gabor sigma 68, angle 45).jpg')
% 
% % BIG sigma convolution
% cgb280piano = convIMG(piano, o280);
% cgb2845piano = convIMG(piano, o2845);
% cgb2890piano = convIMG(piano, o2890);
% cgb480piano = convIMG(piano, o480);
% cgb4845piano = convIMG(piano, o4845);
% cgb4890piano = convIMG(piano, o4890);
% figure(9),
% subplot(3,3,[1,2,3]); imshow(orgpiano,[]); title('piano (original).jpg')
% subplot(3,3,4); imshow(cgb280piano,[]); title('piano (Odd Gabor, lambda 28, angle 0).jpg')
% subplot(3,3,5); imshow(cgb2845piano,[]); title('piano (Odd Gabor, lambda 28, angle 45).jpg')
% subplot(3,3,6); imshow(cgb2890piano,[]); title('piano (Odd Gabor, lambda 28, angle 90).jpg')
% subplot(3,3,7); imshow(cgb480piano,[]); title('piano (Odd Gabor, lambda 48, angle 0).jpg')
% subplot(3,3,8); imshow(cgb4845piano,[]); title('piano (Odd Gabor, lambda 48, angle 45).jpg')
% subplot(3,3,9); imshow(cgb4890piano,[]); title('piano (Odd Gabor, lambda 48, angle 90).jpg')

% % SMALL sigma=4.8 convolution & zero-crossing
% sml0piano = convIMG(piano, osmall0);
% sml45piano = convIMG(piano, osmall45);
% sml90piano = convIMG(piano, osmall90);
% smlZCpiano = zeroCrossingGabor(orgpiano, 500, 4.8);
% figure(10),
% subplot(2,4,[1,2,3,4]); imshow(orgpiano,[]); title('piano (original).jpg')
% subplot(2,4,5); imshow(smlZCpiano,[]); title('piano zero-crossing (Odd Gabor, sigma 4.8, 3-degree).jpg')
% subplot(2,4,6); imshow(sml0piano,[]); title('piano (Odd Gabor, sigma 4.8, angle 0).jpg')
% subplot(2,4,7); imshow(sml45piano,[]); title('piano (Odd Gabor, sigma 4.8, angle 45).jpg')
% subplot(2,4,8); imshow(sml90piano,[]); title('piano (Odd Gabor, sigma 4.8, angle 90).jpg')

% %-----------------------------paolina----------------------------------------

% % BIG sigma Zero-Crossing
% zcG28paolina = zeroCrossingGabor(orgpaolina, 500, 28);
% zcG48paolina = zeroCrossingGabor(orgpaolina, 500, 48);
% zcG68paolina = zeroCrossingGabor(orgpaolina, 500, 68);
% G28paolina = convIMG(paolina, o280);
% G48paolina = convIMG(paolina, o480);
% G68paolina = convIMG(paolina, o680);
% figure(11),
% subplot(4,2,[1,2]); imshow(orgpaolina,[]); title('paolina (original).jpg')
% subplot(4,2,3); imshow(zcG28paolina,[]); title('paolina zero-crossing (3 degrees, sigma 28).jpg')
% subplot(4,2,4); imshow(G28paolina,[]); title('paolina (Applied Gabor sigma 28, angle 0).jpg')
% subplot(4,2,5); imshow(zcG48paolina,[]); title('paolina zero-crossing (3 degrees, sigma 48).jpg')
% subplot(4,2,6); imshow(G48paolina,[]); title('paolina (Applied Gabor sigma 48, angle 0).jpg')
% subplot(4,2,7); imshow(zcG68paolina,[]); title('paolina zero-crossing (3 degrees, sigma 68).jpg')
% subplot(4,2,8); imshow(G68paolina,[]); title('paolina (Applied Gabor sigma 68, angle 0).jpg')

% % BIG sigma convolution
% cgb280paolina = convIMG(paolina, o280);
% cgb2845paolina = convIMG(paolina, o2845);
% cgb2890paolina = convIMG(paolina, o2890);
% cgb480paolina = convIMG(paolina, o480);
% cgb4845paolina = convIMG(paolina, o4845);
% cgb4890paolina = convIMG(paolina, o4890);
% figure(12),
% subplot(3,3,[1,2,3]); imshow(orgpaolina,[]); title('paolina (original).jpg')
% subplot(3,3,4); imshow(cgb280paolina,[]); title('paolina (Odd Gabor, lambda 28, angle 0).jpg')
% subplot(3,3,5); imshow(cgb2845paolina,[]); title('paolina (Odd Gabor, lambda 28, angle 45).jpg')
% subplot(3,3,6); imshow(cgb2890paolina,[]); title('paolina (Odd Gabor, lambda 28, angle 90).jpg')
% subplot(3,3,7); imshow(cgb480paolina,[]); title('paolina (Odd Gabor, lambda 48, angle 0).jpg')
% subplot(3,3,8); imshow(cgb4845paolina,[]); title('paolina (Odd Gabor, lambda 48, angle 45).jpg')
% subplot(3,3,9); imshow(cgb4890paolina,[]); title('paolina (Odd Gabor, lambda 48, angle 90).jpg')

% % SMALL sigma=4.8 convolution & zero-crossing
% sml0paolina = convIMG(paolina, osmall0);
% sml45paolina = convIMG(paolina, osmall45);
% sml90paolina = convIMG(paolina, osmall90);
% smlZCpaolina = zeroCrossingGabor(orgpaolina, 500, 4.8);
% figure(10),
% subplot(2,4,[1,2,3,4]); imshow(orgpaolina,[]); title('paolina (original).jpg')
% subplot(2,4,5); imshow(smlZCpaolina,[]); title('paolina zero-crossing (Odd Gabor, sigma 4.8, 3-degree).jpg')
% subplot(2,4,6); imshow(sml0paolina,[]); title('paolina (Odd Gabor, sigma 4.8, angle 0).jpg')
% subplot(2,4,7); imshow(sml45paolina,[]); title('paolina (Odd Gabor, sigma 4.8, angle 45).jpg')
% subplot(2,4,8); imshow(sml90paolina,[]); title('paolina (Odd Gabor, sigma 4.8, angle 90).jpg')


% %-----------------------------Geometry----------------------------------------
orggeo = imread('Geometry.jpg');
geo = rgb2gray(orggeo);

sml0geo = convIMG(geo, osmall0);
sml45geo = convIMG(geo, osmall45);
sml90geo = convIMG(geo, osmall90);
smlZCgeo = zeroCrossingGabor(orggeo, 300, 0.8);
figure(10),
subplot(2,4,[1,2,3,4]); imshow(orggeo,[]); title('geometry (original).jpg')
subplot(2,4,5); imshow(smlZCgeo,[]); title('geometry zero-crossing (Odd Gabor, 3-degree).jpg')
subplot(2,4,6); imshow(sml0geo,[]); title('geometry (Odd Gabor, angle 0).jpg')
subplot(2,4,7); imshow(sml45geo,[]); title('geometry (Odd Gabor, angle 45).jpg')
subplot(2,4,8); imshow(sml90geo,[]); title('geometry (Odd Gabor, angle 90).jpg')



end