class UserModel {
  String userID;
  int agentID;
  String userName;
  String role;
  int isActive;
  Null expiryDate;
  Null terminateDate;
  Null isLockOut;
  Agent agent;

  UserModel(
      {this.userID,
      this.agentID,
      this.userName,
      this.role,
      this.isActive,
      this.expiryDate,
      this.terminateDate,
      this.isLockOut,
      this.agent});

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    agentID = json['AgentID'];
    userName = json['UserName'];
    role = json['Role'];
    isActive = json['isActive'];
    expiryDate = json['ExpiryDate'];
    terminateDate = json['TerminateDate'];
    isLockOut = json['isLockOut'];
    agent = json['Agent'] != null ? new Agent.fromJson(json['Agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['AgentID'] = this.agentID;
    data['UserName'] = this.userName;
    data['Role'] = this.role;
    data['isActive'] = this.isActive;
    data['ExpiryDate'] = this.expiryDate;
    data['TerminateDate'] = this.terminateDate;
    data['isLockOut'] = this.isLockOut;
    if (this.agent != null) {
      data['Agent'] = this.agent.toJson();
    }
    return data;
  }
}

class Agent {
  int agentID;
  String name;
  String type;
  String branch;

  Agent({this.agentID, this.name, this.type, this.branch});

  Agent.fromJson(Map<String, dynamic> json) {
    agentID = json['AgentID'];
    name = json['Name'];
    type = json['Type'];
    branch = json['Branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AgentID'] = this.agentID;
    data['Name'] = this.name;
    data['Type'] = this.type;
    data['Branch'] = this.branch;
    return data;
  }
}
