%Hitung ASM
asm0 = 0.0;
asm45 = 0.0;
asm90 = 0.0;
asm135 = 0.0;

for a=0 : 255
    for b=0 : 255
    asm0 = asm0 + (GLCM0(a+1,b+1) * GLCM0(a+1,b+1));
    asm45 = asm45 + (GLCM45(a+1,b+1) * GLCM45(a+1,b+1));
    asm90 = asm90 + (GLCM90(a+1,b+1) * GLCM90(a+1,b+1));
    asm135 = asm135 + (GLCM135(a+1,b+1) * GLCM135(a+1,b+1));
    end
end
