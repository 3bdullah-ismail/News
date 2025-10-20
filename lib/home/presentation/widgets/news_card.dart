import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/models/article_response/article.dart';
import 'package:news/main.dart';
import 'package:news/home/presentation/manager/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: () {
        showBottomSheet(
          constraints: BoxConstraints(minHeight: 250.h, maxHeight: 450.h),
          backgroundColor: AppColors.white,
          context: context,
          builder: (context) {
            return SafeArea(
              child: Container(
                padding: REdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage ?? "",
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          height: 220,
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      article.content ?? "",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    CupertinoButton(
                      padding: REdgeInsets.all(8),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "View Full Articel",
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await _launchUrl(Uri.parse(article.url ?? ""));
                      },
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: 360.w,
        height: 325.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    height: 220,
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                article.title ?? "",
                style: context.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "By: ${article.author ?? "Unknown"}",
                      style: context.textTheme.bodySmall!.copyWith(
                        color: AppColors.gray,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    provider.formatDate(article.publishedAt),
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.gray,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
