*Custom Colormap package를 설치해야 함  
Víctor Martínez-Cagigal (2025). Custom Colormap (https://www.mathworks.com/matlabcentral/fileexchange/69470-custom-colormap), MATLAB Central File Exchange.

1. 분석진행할 디렉토리에 아래 폴더들을 생성  
  code  
  rawdata  
2. code 폴더에 m00~m04 파일들을 복사
3. rawdata 폴더에 data (*.nii) 파일들을 복사
4. m00을 열어 EDIT구역 파일이름들 수정후 실행
5. m01을 실행시켜 outer line 파일을 생성하거나 미리 준비된 outer line 파일을 생성된 mat폴더에 복사
6. m02를 실행시켜 slide를 움직여가며 적절한 drawing parameter 결정
7. m03을 실행시켜 EDIT구역 값들을 원하는대로 수정 후 이미지 생성 (out 폴더에 생성됨)
8. 동영상 필요시 m04를 실행시켜 EDIT구역 안쪽 디렉토리 수정 후 실행 (out 폴더 내의 각 폴더에 생성됨)
