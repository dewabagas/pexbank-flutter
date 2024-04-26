import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pexbank/domain/news/models/news.dart';
import 'package:pexbank/presentation/core/constants/assets.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final List<News> listNews = [
    News(
      image: 'image_url_1',
      title: 'Nusatech Token',
      description:
          'Some traders bought bitcoin calls at strikes \$45,000 and...',
      date: '19 Jan 2024',
      author: 'Nusatech News',
    ),
    News(
      image: 'image_url_2',
      title: 'Nusatech Token',
      description:
          'Some traders bought bitcoin calls at strikes \$45,000 and...',
      date: '19 Jan 2024',
      author: 'Nusatech News',
    ),
    News(
      image: 'image_url_3',
      title: 'Nusatech Token',
      description:
          'Some traders bought bitcoin calls at strikes \$45,000 and...',
      date: '19 Jan 2024',
      author: 'Nusatech News',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('News',
                  style: TextStyles.headlineSmall
                      .copyWith(fontSize: 18.sp, color: AppColors.white)),
              Text('See More',
                  style: TextStyles.bodySmall.copyWith(color: AppColors.grey3))
            ],
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listNews.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final news = listNews[index];
              return Container(
                  margin:
                      EdgeInsets.only(bottom: 16.h), // Spasi antara setiap item
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundDark,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            AppImages.imgDoge,
                            width: 94.w,
                            height: 80.h,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: SizedBox(
                          width: 205.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.blue,
                                      AppColors.lightBlue
                                    ],
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  '${news.title}',
                                  style: TextStyles.titleSmall
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text('${news.description}',
                                  style: TextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey3)),
                              Row(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.blue,
                                          AppColors.lightBlue
                                        ],
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      '${news.author}',
                                      style: TextStyles.titleSmall.copyWith(
                                          color: AppColors.white,
                                          fontSize: 10.sp),
                                    ),
                                  ),
                                  Text(' - ',
                                      style: TextStyles.bodySmall.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey3)),
                                  Text('${news.date}',
                                      style: TextStyles.bodySmall.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey3)),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }
}
