package Exercise1;

import java.util.Arrays;
import java.util.Date;

public class Group {

byte	groupID;
String	groupName;
int		creatorID;
Date	creatDate;

Account[] accounts;

@Override
public String toString() {
	return "Group [groupID=" + groupID + ", groupName=" + groupName + ", creatorID=" + creatorID + ", creatDate="
			+ creatDate + ", accounts=" + Arrays.toString(accounts) + "]";
}





}
