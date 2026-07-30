import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  final List<String> images;

  const ImageGallery({super.key, required this.images});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    if (widget.images.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: primary.withOpacity(.08),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.image_outlined,
                size: 48,
                color: primary.withOpacity(.3),
              ),
              const SizedBox(height: 8),
              Text(
                "No screenshots available",
                style: TextStyle(color: primary.withOpacity(.4), fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Allocate: 75% of available height for main image, rest for thumbnails + counter
        final double totalHeight = constraints.maxHeight;
        final double thumbRowHeight = 90.0; // thumbnail height (80) + padding
        final double counterHeight = 24.0;
        final double mainImageHeight =
            totalHeight - thumbRowHeight - counterHeight - 28;

       return Column(
  children: [
    Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Container(
              key: ValueKey(currentIndex),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                widget.images[currentIndex],
                fit: BoxFit.contain,
              ),
            ),
          ),

          if (currentIndex > 0)
            Positioned(
              left: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.white,
                  onPressed: () {
                    setState(() => currentIndex--);
                  },
                ),
              ),
            ),

          if (currentIndex < widget.images.length - 1)
            Positioned(
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: Colors.white,
                  onPressed: () {
                    setState(() => currentIndex++);
                  },
                ),
              ),
            ),
        ],
      ),
    ),

    const SizedBox(height: 15),

    SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = index == currentIndex;

          return InkWell(
            onTap: () {
              setState(() => currentIndex = index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected ? primary : Colors.transparent,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.images[index],
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    ),

    const SizedBox(height: 8),

    Text(
      "${currentIndex + 1} / ${widget.images.length}",
      style: TextStyle(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w600,
      ),
    ),
  ],
);
     
      },
    );
  }
}
