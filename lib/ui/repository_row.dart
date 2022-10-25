import 'package:flutter/material.dart';
import 'package:gh_search_flutter/model/repo.dart';

class RepoRow extends StatelessWidget {
  final Repo repo;

  const RepoRow({required this.repo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                  repo.owner.avatarUrl,
                ),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 4),
              Text(
                repo.owner.login,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            repo.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            repo.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    '${repo.stargazersCount}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                repo.language ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
