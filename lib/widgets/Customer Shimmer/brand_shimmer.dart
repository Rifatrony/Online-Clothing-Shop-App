// ignore_for_file: must_be_immutable
import 'package:cloth_shop_app/widgets/Customer%20Shimmer/title_row_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: const Column(
        children: [
          SizedBox(height: 10),
          TitleAndArrowShimmer(),
          SizedBox(
            height: 8,
          ),
          ItemList(),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade400,
            ),
          );
        },
      ),
    );
  }
}


