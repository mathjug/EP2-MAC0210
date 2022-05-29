function [coefs] = bicubico (fcompressed, pontos)

  f1 = fcompressed(pontos(1,1),pontos(1,2));
  f2 = fcompressed(pontos(2,1),pontos(2,2));
  f3 = fcompressed(pontos(3,1),pontos(3,2));
  f4 = fcompressed(pontos(4,1),pontos(4,2));
  
  df1x = aprox_derivada_x(fcompressed,pontos(1,1),pontos(1,2));
  df2x = aprox_derivada_x(fcompressed,pontos(2,1),pontos(2,2));
  df3x = aprox_derivada_x(fcompressed,pontos(3,1),pontos(3,2));
  df4x = aprox_derivada_x(fcompressed,pontos(4,1),pontos(4,2));
  
  df1y = aprox_derivada_y(fcompressed,pontos(1,1),pontos(1,2));
  df2y = aprox_derivada_y(fcompressed,pontos(2,1),pontos(2,2));
  df3y = aprox_derivada_y(fcompressed,pontos(3,1),pontos(3,2));
  df4y = aprox_derivada_y(fcompressed,pontos(4,1),pontos(4,2));
  
  df1xy = (aprox_derivada_y(fcompressed,pontos(1,1)+1,pontos(1,2)) - 
          aprox_derivada_y(fcompressed,pontos(1,1)-1,pontos(1,2))) / (2*h);
  df2xy = (aprox_derivada_y(fcompressed,pontos(2,1)+1,pontos(2,2)) - 
          aprox_derivada_y(fcompressed,pontos(2,1)-1,pontos(2,2))) / (2*h);
  df3xy = (aprox_derivada_y(fcompressed,pontos(3,1)+1,pontos(3,2)) - 
          aprox_derivada_y(fcompressed,pontos(3,1)-1,pontos(3,2))) / (2*h);
  df4xy = (aprox_derivada_y(fcompressed,pontos(4,1)+1,pontos(4,2)) - 
          aprox_derivada_y(fcompressed,pontos(4,1)-1,pontos(4,2))) / (2*h);
          
    
  coefs = nan(4,4);
  B = [1,0,0,0;
       1,h,h**2,h**3;
       0,1,0,0;
       0,1,2*h,(3*h)**2;];

  F = [f1,f2,     df1y,df2y;
       f3,f4,     df3y,df4y;
       df1x,df2x, df1xy,df2xy;
       df3x,df4x, df3xy,df4xy;];
       
  %resolver: F = B * coefs * Bt
  %          B-1 * F * Bt-1 = coefs
       
  
endfunction
