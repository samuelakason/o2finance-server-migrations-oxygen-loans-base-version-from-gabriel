import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CachedNetworkImageLoader extends StatelessWidget {
  const CachedNetworkImageLoader(
      {Key? key,
      required this.imgUrl,
      required this.borderRadius,
      required this.height,
      required this.width,
      required this.errorWidget})
      : super(key: key);
  final String imgUrl;
  final BorderRadius borderRadius;
  final double height, width;
  final String errorWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey,
            child: Container(
              margin: EdgeInsets.only(right: 0),
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.black26,
              ),
            )),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: AssetImage(OxygenApp.accNumber),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularCachedNetworkImageLoader extends StatelessWidget {
  const CircularCachedNetworkImageLoader(
      {Key? key,
      required this.imgUrl,
      required this.height,
      required this.width,
      required this.errorWidget})
      : super(key: key);
  final String imgUrl;

  final double height, width;
  final String errorWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey,
          child: Container(
            margin: EdgeInsets.only(right: 0),
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black26,
            ),
          )),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(OxygenApp.accNumber),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader(
      {Key? key,
      required this.imgUrl,
      required this.borderRadius,
      required this.height,
      required this.width})
      : super(key: key);
  final String imgUrl;
  final BorderRadius borderRadius;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey,
            child: Container(
              margin: EdgeInsets.only(right: 0),
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Image.network(
              imgUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Container(
                  //padding: EdgeInsets.all(3.w),
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.w),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/placee.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey,
                  child: Container(
                    margin: EdgeInsets.only(right: 0),
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      color: Colors.black26,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
