import 'package:av_catalog/constants.dart';
import 'package:av_catalog/model/menu_item.dart';
import 'package:av_catalog/widgets/delete_card.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final MenuItem menuItem;

  const ItemCard({this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 20.0, left: 16, right: 16),
                    child: Image.network(
                      menuItem.imageUrl,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      loadingBuilder:
                          (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          defaultImage,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    menuItem.title,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 12.0,
              top: 8.0,
              child: DeleteButton(menuItem: menuItem),
            ),
          ],
        ),
      ),
    );
  }
}
