package Assignment2;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;

public class Group {

public byte	groupID;
public String	groupName;
int		creatorID;
Date	creatDate;

Account[] accounts;
public LocalDate createDate;

@Override
public String toString() {
	return "Group [groupID=" + groupID + ", groupName=" + groupName + ", creatorID=" + creatorID + ", creatDate="
			+ creatDate + ", accounts=" + Arrays.toString(accounts) + "]";
}





}
