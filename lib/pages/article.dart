import 'package:api_consumption/models/article_model.dart';
import 'package:flutter/material.dart';

class ApiCalling extends StatelessWidget {
  const ApiCalling({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final publishedAt = article.publishedAt?.split('T')[0];
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: article.imageUrl != null
                ? NetworkImage(article.imageUrl!)
                : null,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title!,
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.author,
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    article.source.name ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Flexible(
                        child: Text(
                          publishedAt ?? '',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
