import '../generated/l10n.dart';
import '../res.dart';

class PageModel {
  String imageAssetPath;
  String title;
  String desc;

  PageModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<PageModel> getSlides() {
  List<PageModel> slides = [];
  PageModel sliderModel = new PageModel();

  slides.add(PageModel(
      title: S.current.slide_1_title,
      desc: S.current.slide_1_sub_title,
      imageAssetPath: Res.home));
  slides.add(PageModel(
      title: S.current.slide_2_title,
      desc: S.current.slide_2_sub_title,
      imageAssetPath: Res.onboarding_animation));
  slides.add(PageModel(
      title: S.current.slide_3_title,
      desc: S.current.slide_3_sub_title,
      imageAssetPath: Res.travel_tickets));

  return slides;
}
