package com.lhm.shoplhm.services;

import java.util.List;
import java.util.Optional;

import com.lhm.shoplhm.models.Review;
import com.lhm.shoplhm.repositories.ReviewRepository;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;
    
    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }
	//return all the review
	public List<Review> allReviews(){
		return reviewRepository.findAll();
	}
	
	//retrieve a review
	public Review findReview(Long id) {
		Optional<Review> optionalReview = reviewRepository.findById(id);
		if(optionalReview.isPresent()) {
			return optionalReview.get();
		} else {
			return null;
		}
	}
	
	//delete a review
	public void deleteReview(Long id) {
		Review review = findReview(id);
		reviewRepository.delete(review);
	}
	
    //creation the review
    public Review createReview(Review review) {
    	return reviewRepository.save(review);
    }
//	//update a review
//	public Review updateReview(Long id, String content) {
//		Review review = findReview(id);
//		review.setContent(content);
//		reviewRepository.save(review);
//		return review;
//	}

}
