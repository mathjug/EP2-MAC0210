function end_imagem = funcao2 (p)
% função que monta uma imagem utilizando f(x,y) = (1 / (1 + y²), 1 - (1 / (1 + x² + y²)), 1 / (1 + x²))
  x_ = y_ = 0; % recebem valores de 0 a 2
  
  for x = 1:p
    for y = 1:p
      img(x,y,1) = 1 / (1 + y_**2);
      img(x,y,2) = 1 - (1 / (1 + x_**2 + y_**2));
      img(x,y,3) = 1 / (1 + x_**2);
      y_ = y * (2 / (p - 1));
    endfor
    x_ = x * (2 / (p - 1));
  endfor
  
  end_imagem = "f_img.png";
  imwrite (img, end_imagem, "Quality", 100);
endfunction