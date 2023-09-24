import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 64),
            Image.asset("assets/icons/supabase-icon.png",
                width: 32, height: 32),
            const SizedBox(width: 8),
            const Text("Supabase")
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final url = Uri.parse("https://github.com/Enriquefft/RDBMS-BD2");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                //TODO: Notificar al usuario
              }
            },
            child: Row(
              children: [
                const Icon(
                  Icons.star_border_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Text(
                  "Star us on GitHub",
                  style: textStyle.labelMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              context.push('/dashboard/project/unknown');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(47, 156, 107, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              "Dashboard",
              style: textStyle.labelMedium,
            ),
          ),
          const SizedBox(width: 32),
        ],
      ),
      body: HomeView(textStyle: textStyle),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.textStyle,
  });

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.48,
        heightFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Build in a weekend",
              style: textStyle.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "Scale to millions",
              style: textStyle.headlineLarge!.copyWith(
                color: const Color.fromRGBO(62, 207, 145, 1.0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              "Supabase is an open source Firebase alternative.",
              style: textStyle.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              "Start your project with a Postgres database, Authentication, instant APIs, Edge Functions, Realtime subscriptions, Storage, and Vector embeddings.",
              style: textStyle.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(47, 156, 107, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    child: Text(
                      "Start your project",
                      style: textStyle.labelMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(52, 52, 52, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.book_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Documentation",
                          style: textStyle.labelMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 76),
            Text(
              "Works seamlessly with 20+ frameworks",
              style: textStyle.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
