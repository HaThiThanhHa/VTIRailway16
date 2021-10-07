package com.vti.entity;

import com.vti.entity.PositionName;

public class Position {

private	int 			positionID;	
private	PositionName 	positionName;

public Position () {
}

public int getPositionID() {
	return positionID;
}

public void setPositionID(int positionID) {
	this.positionID = positionID;
}

public PositionName getPositionName() {
	return positionName;
}

public void setPositionName(PositionName positionName) {
	this.positionName = positionName;

}
}