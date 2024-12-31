import 'package:flutter/material.dart';

import 'cached_image_item.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  // on tap event
  final Function()? onTap;

  const MovieItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Trigger the onTap event when the item is tapped
      onTap: onTap,
      child: Card(
        elevation: 5, // Adds shadow effect to the card
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Rounded corners for the card
        ),
        child: Container(
          width: 300, // Fixed width for the MovieItem
          height: 400, // Fixed height for each MovieItem
          padding: const EdgeInsets.all(8), // Padding inside the container
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for the image
                child: SizedBox(
                  height: 250, // Defines the height of the image
                  width: double
                      .infinity, // The image will take up the entire width available
                  child: /* You can replace this with an Image widget, but we're using CachedImageItem now for optimization */
                      CachedImageItem(
                          imageUrl:
                              imageUrl), // Custom widget to handle image caching
                ),
              ),
              const SizedBox(
                  height: 8), // Adds space between the image and the text
              Text(
                title, // Displays the movie title
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold, // Bold text for the title
                    ),
                maxLines: 1, // Limits title to one line
                overflow: TextOverflow
                    .ellipsis, // If the title is too long, show ellipsis
              ),
              const SizedBox(
                  height:
                      8), // Adds space between the title and the description
              Text(
                description, // Displays the movie description
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge, // Uses the body text style
                textAlign: TextAlign.justify, // Justifies the text
                maxLines: 2, // Limits description to two lines
                overflow: TextOverflow
                    .ellipsis, // If the description is too long, show ellipsis
              ),
            ],
          ),
        ),
      ),
    );
  }
}
