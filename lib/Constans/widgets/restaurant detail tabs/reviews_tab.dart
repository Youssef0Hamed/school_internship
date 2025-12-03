import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/review_model.dart';


class ReviewsTab extends StatefulWidget {
  final List<Review> reviews;
  final Function(Review) onAddReview;

  const ReviewsTab({
    Key? key,
    required this.reviews,
    required this.onAddReview,
  }) : super(key: key);

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    if (_reviewController.text.isEmpty || _rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add a rating and review text'),
        ),
      );
      return;
    }

    final newReview = Review(
      id: DateTime.now().toString(),
      userName: 'You',
      userImage: 'https://i.pravatar.cc/150?img=0',
      rating: _rating,
      reviewText: _reviewController.text,
      createdAt: DateTime.now(),
    );

    widget.onAddReview(newReview);
    _reviewController.clear();
    _rating = 0;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Review added successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Write Review Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _reviewController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Write a review',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                // Rating stars
                Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = (index + 1).toDouble();
                        });
                      },
                      child: Icon(
                        Icons.star,
                        color: index < _rating ? Colors.amber : Colors.grey.shade300,
                        size: 24,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitReview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Submit Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Reviews List
          Text(
            'Reviews (${widget.reviews.length})',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.reviews.length,
            itemBuilder: (context, index) {
              final review = widget.reviews[index];
              return _buildReviewCard(review);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Review review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info and rating
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(review.userImage),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < review.rating ? Colors.amber : Colors.grey.shade300,
                          size: 16,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${review.rating.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Review text
          Text(
            review.reviewText,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}