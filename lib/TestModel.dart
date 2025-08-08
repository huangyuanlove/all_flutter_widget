/// text : "您可以进行在线问诊，权威医生为您解答"
/// type : "recomend_doctor"
/// quick_ask : {"icon":"https://staff.chunyu.mobi/@/media/images/2025/03/15/5656/4368ca08f5e5_w96_h96_.png","title":"快速问诊","desc":"智能匹配 秒级响应 权威解答"}
/// doctors : [{"id":"clinic_web_5fd7ef18e1203708","name":"明波","title":"主任医师","clinic_name":"儿科","hospital_name":"北京协和医院","image":"https://resourced.chunyu.mobi/uGkAAEm_JZXKL-MU-ffa30957-ca18-4732-aea4-64ff1c59c071_w1144_h1144_.jpg?imageMogr2/thumbnail/150x","price_text":"¥30","price_fen":3000,"good_at":"擅长: 流感、风寒感冒、风热感冒、小儿感冒、垂体疾病、内分泌失调、宝宝感冒","good_at_rich_text":"<span style=\"color:#666666\">擅长: 流感、风寒</span><span style=\"color:#ff6134\">感冒</span><span style=\"color:#666666\">、风热</span><span style=\"color:#ff6134\">感冒</span><span style=\"color:#666666\">、</span><span style=\"color:#ff6134\">小</span><span style=\"color:#666666\">儿</span><span style=\"color:#ff6134\">感冒</span><span style=\"color:#666666\">、垂体疾病、内分泌失调、宝宝</span><span style=\"color:#ff6134\">感冒</span>","reply_num":2530,"rank_tag":"百强医院","default_select":true,"is_3a_hospital":true,"is_active":false,"new_tags":[{"name":"百强医院","tag_type":4,"icon":"","enable":true,"highlight":true},{"name":"可开处方","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"高性价比","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"专业有效","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"耐心细致","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"北京市","tag_type":0,"icon":"","enable":true,"highlight":false}],"service_data_list":[{"name":"","descrip":"4.2","icon":"https://staff.chunyu.mobi/@/media/images/2022/03/04/33eb/2a7fba4439d5_w28_h28_.png"},{"name":"接诊量","descrip":"2.5千","icon":""}],"qa_tags":[],"comment_tag":"iuuuuuuuuuuuuuuuuuuuu","can_pres":true,"is_top_100_hospital":true,"is_recommend":true},{"id":"clinic_web_8b94334d0f8a52cd","name":"木婉清","title":"主治医师","clinic_name":"整形美容科","hospital_name":"北京协和医院","image":"https://resourced.chunyu.mobi/mv8AAABndq2Rb10W-dc8da183-7f14-4f80-b3d4-7a87d671b75a_w1440_h1440_.jpg?imageMogr2/thumbnail/150x","price_text":"¥29","price_fen":2900,"good_at":"擅长: 结膜炎、过敏、颈椎病、肺结核、神经衰弱、霉菌性阴道炎、乳腺增生","good_at_rich_text":"<span style=\"color:#666666\">擅长: 结膜炎、过敏、颈椎病、肺结核、神经衰弱、霉菌性阴道炎、乳腺增生</span>","reply_num":923,"rank_tag":"百强医院","default_select":false,"is_3a_hospital":true,"is_active":false,"new_tags":[{"name":"百强医院","tag_type":4,"icon":"","enable":true,"highlight":true},{"name":"可开处方","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"从业27年","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"高性价比","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"北京市","tag_type":0,"icon":"","enable":true,"highlight":false}],"service_data_list":[{"name":"","descrip":"4.1","icon":"https://staff.chunyu.mobi/@/media/images/2022/03/04/33eb/2a7fba4439d5_w28_h28_.png"},{"name":"接诊量","descrip":"923","icon":""}],"qa_tags":[],"comment_tag":"","can_pres":true,"is_top_100_hospital":true,"is_recommend":true}]
/// query : {"text":"创建问题的首问"}
/// filter : {"clinic_no":"12a","second_class_clinic_no":"12a"}
/// recommend_id : "str"
/// from_type : "find_doctor/recommend_doctor"

class Content {
  Content({
    this.text,
    this.status,
    this.userMsgId,
    this.quickAsk,
    this.doctors,
    this.query,
    this.filter,
    this.recommendId,
    this.fromType,
  });

  Content.fromJson(dynamic json) {
    text = json['text'];
    status = json['status'];
    userMsgId = json['user_msg_id'];
    quickAsk =
        json['quick_ask'] != null ? QuickAsk.fromJson(json['quick_ask']) : null;
    if (json['doctors'] != null) {
      doctors = [];
      json['doctors'].forEach((v) {
        doctors?.add(Doctors.fromJson(v));
      });
    }
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
    filter = json['filter'] != null ? Filter.fromJson(json['filter']) : null;
    recommendId = json['recommend_id'];
    fromType = json['from_type'];
  }

  String? text;
  String? type;
  QuickAsk? quickAsk;
  List<Doctors>? doctors;
  Query? query;
  Filter? filter;
  String? recommendId;
  String? fromType;
  num? userMsgId;
  String? status;
}

/// clinic_no : "12a"
/// second_class_clinic_no : "12a"

class Filter {
  Filter({
    this.clinicNo,
    this.secondClassClinicNo,
  });

  Filter.fromJson(dynamic json) {
    clinicNo = json['clinic_no'];
    secondClassClinicNo = json['second_class_clinic_no'];
  }

  String? clinicNo;
  String? secondClassClinicNo;
}

/// text : "创建问题的首问"

class Query {
  Query({
    this.text,
  });

  Query.fromJson(dynamic json) {
    text = json['text'];
  }

  String? text;
}

/// id : "clinic_web_5fd7ef18e1203708"
/// name : "明波"
/// title : "主任医师"
/// clinic_name : "儿科"
/// hospital_name : "北京协和医院"
/// image : "https://resourced.chunyu.mobi/uGkAAEm_JZXKL-MU-ffa30957-ca18-4732-aea4-64ff1c59c071_w1144_h1144_.jpg?imageMogr2/thumbnail/150x"
/// price_text : "¥30"
/// price_fen : 3000
/// good_at : "擅长: 流感、风寒感冒、风热感冒、小儿感冒、垂体疾病、内分泌失调、宝宝感冒"
/// good_at_rich_text : "<span style=\"color:#666666\">擅长: 流感、风寒</span><span style=\"color:#ff6134\">感冒</span><span style=\"color:#666666\">、风热</span><span style=\"color:#ff6134\">感冒</span><span style=\"color:#666666\">、</span><span style=\"color:#ff6134\">小</span><span style=\"color:#666666\">儿</span><span style=\"color:#ff6134\">感冒</span><span style=\"color:#666666\">、垂体疾病、内分泌失调、宝宝</span><span style=\"color:#ff6134\">感冒</span>"
/// reply_num : 2530
/// rank_tag : "百强医院"
/// default_select : true
/// is_3a_hospital : true
/// is_active : false
/// new_tags : [{"name":"百强医院","tag_type":4,"icon":"","enable":true,"highlight":true},{"name":"可开处方","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"高性价比","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"专业有效","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"耐心细致","tag_type":0,"icon":"","enable":true,"highlight":false},{"name":"北京市","tag_type":0,"icon":"","enable":true,"highlight":false}]
/// service_data_list : [{"name":"","descrip":"4.2","icon":"https://staff.chunyu.mobi/@/media/images/2022/03/04/33eb/2a7fba4439d5_w28_h28_.png"},{"name":"接诊量","descrip":"2.5千","icon":""}]
/// qa_tags : []
/// comment_tag : "iuuuuuuuuuuuuuuuuuuuu"
/// can_pres : true
/// is_top_100_hospital : true
/// is_recommend : true

class Doctors {
  Doctors({
    this.id,
    this.name,
    this.title,
    this.clinicName,
    this.hospitalName,
    this.image,
    this.priceText,
    this.priceFen,
    this.goodAt,
    this.goodAtRichText,
    this.replyNum,
    this.rankTag,
    this.defaultSelect,
    this.is3aHospital,
    this.isActive,
    this.newTags,
    this.serviceDataList,
    this.qaTags,
    this.commentTag,
    this.canPres,
    this.isTop100Hospital,
    this.isRecommend,
  });

  Doctors.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    clinicName = json['clinic_name'];
    hospitalName = json['hospital_name'];
    image = json['image'];
    priceText = json['price_text'];
    priceFen = json['price_fen'];
    goodAt = json['good_at'];
    goodAtRichText = json['good_at_rich_text'];
    replyNum = json['reply_num'];
    rankTag = json['rank_tag'];
    defaultSelect = json['default_select'];
    is3aHospital = json['is_3a_hospital'];
    isActive = json['is_active'];
    if (json['new_tags'] != null) {
      newTags = [];
      json['new_tags'].forEach((v) {
        newTags?.add(NewTags.fromJson(v));
      });
    }
    if (json['service_data_list'] != null) {
      serviceDataList = [];
      json['service_data_list'].forEach((v) {
        serviceDataList?.add(ServiceDataList.fromJson(v));
      });
    }
    if (json['qa_tags'] != null) {
      qaTags = [];
      json['qa_tags'].forEach((v) {
        qaTags?.add(Dynamic.fromJson(v));
      });
    }
    commentTag = json['comment_tag'];
    canPres = json['can_pres'];
    isTop100Hospital = json['is_top_100_hospital'];
    isRecommend = json['is_recommend'];
  }

  String? id;
  String? name;
  String? title;
  String? clinicName;
  String? hospitalName;
  String? image;
  String? priceText;
  num? priceFen;
  String? goodAt;
  String? goodAtRichText;
  num? replyNum;
  String? rankTag;
  bool? defaultSelect;
  bool? is3aHospital;
  bool? isActive;
  List<NewTags>? newTags;
  List<ServiceDataList>? serviceDataList;
  List<dynamic>? qaTags;
  String? commentTag;
  bool? canPres;
  bool? isTop100Hospital;
  bool? isRecommend;
}

/// name : ""
/// descrip : "4.2"
/// icon : "https://staff.chunyu.mobi/@/media/images/2022/03/04/33eb/2a7fba4439d5_w28_h28_.png"

class ServiceDataList {
  ServiceDataList({
    this.name,
    this.descrip,
    this.icon,
  });

  ServiceDataList.fromJson(dynamic json) {
    name = json['name'];
    descrip = json['descrip'];
    icon = json['icon'];
  }

  String? name;
  String? descrip;
  String? icon;

}

/// name : "百强医院"
/// tag_type : 4
/// icon : ""
/// enable : true
/// highlight : true

class NewTags {
  NewTags({
    this.name,
    this.tagType,
    this.icon,
    this.enable,
    this.highlight,
  });

  NewTags.fromJson(dynamic json) {
    name = json['name'];
    tagType = json['tag_type'];
    icon = json['icon'];
    enable = json['enable'];
    highlight = json['highlight'];
  }

  String? name;
  num? tagType;
  String? icon;
  bool? enable;
  bool? highlight;

}

/// icon : "https://staff.chunyu.mobi/@/media/images/2025/03/15/5656/4368ca08f5e5_w96_h96_.png"
/// title : "快速问诊"
/// desc : "智能匹配 秒级响应 权威解答"

class QuickAsk {
  QuickAsk({
    this.icon,
    this.title,
    this.desc,
  });

  QuickAsk.fromJson(dynamic json) {
    icon = json['icon'];
    title = json['title'];
    desc = json['desc'];
  }

  String? icon;
  String? title;
  String? desc;

}
