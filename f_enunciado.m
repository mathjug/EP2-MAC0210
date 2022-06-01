function [end_imagem] = f_enunciado (p)
  % função que monta uma imagem utilizando f(x,y) = (sen(x), (sen(y) + sen(x)) / 2, sen(x))
  x_ = y_ = 0; % recebem valores de 0 a pi
  
  for x = 1:p
    for y = 1:p
      img(x,y,1) = (sin(x_) + 1) / 2; % adapta-se a função seno para que ela fique no intervalo [0, 1] (imread)
      img(x,y,2) = (((sin(y_) + sin(x_)) / 2) + 1) / 2;
      img(x,y,3) = (sin(x_) + 1) / 2;
      y_ = y * (pi / (p - 1));
    endfor
    x_ = x * (pi / (p - 1));
  endfor
  
  end_imagem = "f_img.png";
  imwrite (img, end_imagem, "Quality", 100);
endfunction