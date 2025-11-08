import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/shared/theme/app_text_style.dart';

class MiniHomeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const MiniHomeCard({Key? key, required this.title, required this.imageUrl, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      height: 152.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            children: [
              // Resim - Sağa yaslanmış, yarısı overflow
              Positioned(
                right: -40.w, // Yarısını dışarı taşır
                top: 16.h,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(12.r)),
                  child: Image.network(
                    imageUrl,
                    width: 120.w, // Toplam genişlik, yarısı gizli
                    height: 152.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Text - Sol üst köşede
              Positioned(
                top: 16.h,
                left: 16.w,
                right: 90.w, // Resim için boşluk
                child: Text(title, style: AppTextStyles.body16Medium, maxLines: 3, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
