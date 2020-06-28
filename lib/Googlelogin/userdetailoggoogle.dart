
  class UserDetail
  {
     final String providersdetail;
     final String username;
     final String photourl;
     final String useremail;
     final List<ProvidersDetail> providerdata;
     UserDetail({this.username,this.photourl,this.providerdata,this.useremail,this.providersdetail});
  }

  class ProvidersDetail
  {

  final String providerdetails;
  ProvidersDetail({this.providerdetails});
  }