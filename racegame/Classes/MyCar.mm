/*
 *  MyCar.mm
 *  racegame
 *
 */

#include "MyCar.h"

MyCar::MyCar(float x, float y, float angle, float radius){
	this->x = x;
	this->y = y;
	this->angle = angle;
	this->radius = radius;
	
	//慣性力は最初の状態では0にします
	this->powerX = 0.0f;
	this->powerY = 0.0f;
	
	//アクセルと左右旋回は最初の状態ではオフにします
	this->turnLeftFlag = NO;
	this->turnRightFlag = NO;
	this->accelFlag = NO;
}

void MyCar::update(){
	if (turnLeftFlag == YES) angle += 3.0f;	//左旋回ボタンが押されていたら左に回転します
	if (turnRightFlag == YES) angle -= 3.0f;//右旋回ボタンが押されていたら右に回転します
	
	if(accelFlag == YES){
		float theta = angle / 180.0f * M_PI;
		powerX += cos(theta) * 0.000125f;		//この部分の値は好みにあわせて変更してください
		powerY += sin(theta) * 0.000125f;		//この部分の値は好みにあわせて変更してください
	}
	
	//摩擦や空気抵抗で2%ずつ力を減衰させていきます
	powerX *= 0.98f;	//この部分の値は好みにあわせて変更してください
	powerY *= 0.98f;	//この部分の値は好みにあわせて変更してください
	
	//現在の力の分だけ車を移動します
	x += powerX;
	y += powerY;
}