function [decompressedImg] = decompress (compressedImg, method, k, h)
  % função que, recebendo uma imagem comprimida, faz a sua descompressão
  compressed = double(imread (compressedImg)); % compressed é uma matriz NxNx3
  
  [n n cores] = size(compressed);
  p = n + (n - 1) * k;
  %if (cores > 1)
  %  img = zeros(p, p, 3); % cria matriz PxPx3 com valores 0
  %else
  %  img = zeros(p, p);
  %endif
  
  d = h / (k + 1); % d é a distancia entre cada ponto e seu adjacente
  x0 = y0 = 0;
  
  for m = 1:cores
    for i = 1:n-1
      for j = 1:n-1
        % achar os coeficientes do polinomio para o quadrado de lado h    
        pontos = [i,j; i,j+1; i+1,j; i+1,j+1];
        if (method == 1)
          if (cores > 1)
             coefs = bilinear(compressed(:,:,m), pontos, h);
          else
             coefs = bilinear(compressed(:,:), pontos, h);
          endif
        else
          if (cores > 1)
            coefs = bicubico(compressed(:,:,m), pontos, h);
          else
            coefs = bicubico(compressed(:,:), pontos, h);
          endif
        endif

        % colocar na matriz p x p 
        linha_ini = (((i - 1) * k) + i);
        coluna_ini = (((j - 1) * k) + j);
        
        xi = x0 + i*h;
        yj = y0 + j*h;
        
        for a = linha_ini:(i*k)+(i+1)
          for b = coluna_ini:(j*k)+(j+1)
            % calculo do polinomio no ponto (xi + (a-lini)*d, yi + (b-cini)*d)
            x = xi + (a - linha_ini) * d;
            y = yj + (b - coluna_ini) * d;
            
            if (method == 1)
              p = coefs(1) + coefs(2) * (x - xi) + coefs(3) * (y - yj) + coefs(4) * (x - xi) * (y - yj);
            else
              p = [1, (x - xi), (x - xi)**2, (x - xi)**3] * coefs * [1; (y - yj); (y - yj)**2; (y - yj)**3];
            endif
            if (cores > 1)
              img(a, b, m) = p;
            else
              img(a, b) = p;
            endif
          endfor
        endfor   
      endfor
    endfor
  endfor
  img = uint16(img);
  imwrite (img, "decompressed.png", "Quality", 100);
  decompressedImg = "decompressed.png";
  
endfunction
