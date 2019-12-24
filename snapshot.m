function I = snapshot
robot = java.awt.Robot(); %����java.awt.Robot����robot���Զ�����
rectangle = java.awt.Rectangle(); %����java.awt.Rectangle����rectangle������
rectangle.x = 1; % ��ͼ���ϽǺ����꣨��Ļ�����Ͻ�Ϊԭ�㣩
rectangle.y = 1; % ��ͼ���Ͻ������꣨��Ļ�����Ͻ�Ϊԭ�㣩
rectangle.width = 1920; % ��ͼ��ȣ���Ļ�����Ͻ�Ϊԭ�㣩
rectangle.height = 1080; % ��ͼ�߶ȣ���Ļ�����Ͻ�Ϊԭ�㣩
image = robot.createScreenCapture(rectangle); %������������Ļ�ж�ȡ�����ص�ͼ��
w = image.getWidth(); %��ȡͼ����
h = image.getHeight(); %��ȡͼ��߶�
raster = image.getData(); %��ȡͼ��RGB���ݣ�����Raster��Ķ���
I = zeros(w*h*3,1); %�����洢RGB������Ϣ��double����
I = raster.getPixels(0,0,w,h,I); %��ȡͼ��һάRGB��ɫ����
I = uint8(I); %ת����uint8��������
I1 = I(1:3:length(I)); %��ȡRɫһά����
I1 = reshape(I1,w,h); %ת��ΪRɫ��ά����
I2 = I(2:3:length(I)); %��ȡGɫһά����
I2 = reshape(I2,w,h); %ת��ΪGɫ��ά����
I3 = I(3:3:length(I)); %��ȡBɫһά����
I3 = reshape(I3,w,h); %ת��ΪBɫ��ά����
I = uint8(zeros(w,h,3)); %�����洢RGBͼ����Ϣ��ά����
I(1:w,1:h,1) = I1; %����Rɫ����
I(1:w,1:h,2) = I2; %����Gɫ����
I(1:w,1:h,3) = I3; %����Bɫ����
I = imrotate(I,-90,'nearest'); %ͼ��˳ʱ����ת90��
I = flipdim(I,2); %ͼ����ֱ����
end

