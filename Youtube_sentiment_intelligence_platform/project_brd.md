# Business Requirements Document (BRD)

## YouTube Sentiment Intelligence Platform

**Document Version**: 1.0  
**Date**: October 15, 2025  
**Project Duration**: 3 weeks  
**Status**: Approved - Ready for Development

---

## Executive Summary

### Business Problem

Brands and content creators receive thousands of YouTube comments daily but lack efficient tools to understand audience sentiment at scale. Manual analysis is time-consuming (5-10 hours per video), subjective, and often misses critical negative feedback that could escalate into PR crises.

### Proposed Solution

An automated sentiment analysis platform that processes YouTube comments in real-time, providing actionable insights to both brand managers and content creators. The platform will analyze 1000+ comments in under 5 seconds with 85%+ accuracy.

### Business Value

- **Time Savings**: Reduce analysis time from 5 hours to 5 seconds per video (99.97% reduction)
- **Cost Savings**: Eliminate need for manual comment review teams
- **Risk Mitigation**: Early detection of negative sentiment spikes before PR crisis
- **Content Optimization**: Data-driven insights for creators to improve engagement
- **Competitive Intelligence**: Compare sentiment across competitor videos

### Success Metrics

- Achieve 85%+ sentiment classification accuracy
- Process 1000 comments in < 5 seconds
- Support 100+ concurrent users
- 90% user satisfaction rating
- ROI: Save brands 20+ hours/week

---

## 1. Project Scope

### 1.1 In Scope

#### Phase 1 (Week 1) - MVP Foundation

- YouTube comment data collection via API
- Basic text preprocessing and cleaning
- Baseline sentiment analysis (VADER + TextBlob)
- Simple command-line interface
- API response caching system

#### Phase 2 (Week 2) - Advanced Analytics

- Custom machine learning models (Logistic Regression, Random Forest, Gradient Boosting)
- Ensemble model combining multiple approaches
- Model comparison and evaluation
- Training data creation (500-1000 labeled comments)
- Hybrid intelligent routing system

#### Phase 3 (Week 3) - Production Dashboard

- Interactive web dashboard (Streamlit)
- Brand monitoring mode
- Creator analytics mode
- Data visualization (charts, word clouds, metrics)
- Export functionality (CSV)
- Cloud deployment (Streamlit Cloud)

### 1.2 Out of Scope (Future Enhancements)

- Multi-language support (English only for v1)
- Real-time streaming analysis
- Mobile application
- BERT/Transformer models
- Aspect-based sentiment (product features)
- Video transcript analysis
- Historical trend analysis beyond 1 video
- User authentication system
- Paid subscription tiers
- API for third-party integration

### 1.3 Assumptions

- Users have stable internet connection
- YouTube Data API v3 remains available and free tier sufficient
- Comments are primarily in English
- Users provide valid YouTube video URLs
- Maximum 10,000 API quota units per day per user
- Comments API returns standard format

### 1.4 Constraints

- YouTube API free tier: 10,000 units/day
- Each comment page request: 1 unit
- Max 100 comments per API request
- Must comply with YouTube Terms of Service
- No storage of personal user data
- Budget: $0 (free tier only)
- Timeline: 21 days (3 weeks)

---

## 2. Stakeholders

### 2.1 Primary Users

**Persona 1: Brand Marketing Manager**

- **Name**: Sarah Chen, Digital Marketing Manager at TechCorp
- **Age**: 32
- **Goals**: Monitor brand reputation, identify PR risks, understand customer pain points
- **Pain Points**: Too many comments to read, misses negative feedback, delayed crisis response
- **Success Criteria**: Can analyze 5 product launch videos per week, identify top 3 customer complaints

**Persona 2: YouTube Content Creator**

- **Name**: Alex Rodriguez, Tech Review YouTuber (500K subscribers)
- **Age**: 28
- **Goals**: Understand what content resonates, improve engagement, grow channel
- **Pain Points**: Can't read all comments, doesn't know which topics to cover next
- **Success Criteria**: Identify audience's favorite video topics, optimize posting strategy

### 2.2 Secondary Stakeholders

- Data Science Hiring Managers (evaluating portfolio)
- Social Media Agencies (potential clients)
- Market Research Teams
- PR/Communications Teams

---

## 3. Functional Requirements

### 3.1 Data Collection Module

**REQ-DC-001**: System shall fetch comments from YouTube videos using official API  
**Priority**: CRITICAL  
**Acceptance Criteria**:

- User provides valid YouTube video URL
- System extracts video ID from URL
- System fetches up to 1000 comments per video
- System handles pagination automatically

**REQ-DC-002**: System shall cache API responses locally  
**Priority**: CRITICAL  
**Acceptance Criteria**:

- First request fetches from API
- Subsequent requests use cached data
- Cache stored in JSON format
- Cache expires after 7 days (configurable)

**REQ-DC-003**: System shall handle API errors gracefully  
**Priority**: HIGH  
**Acceptance Criteria**:

- Display user-friendly error messages
- Handle disabled comments scenario
- Handle deleted videos scenario
- Handle quota exceeded scenario
- Retry logic with exponential backoff

### 3.2 Data Processing Module

**REQ-DP-001**: System shall clean comment text  
**Priority**: CRITICAL  
**Acceptance Criteria**:

- Remove HTML entities
- Remove URLs
- Remove @mentions
- Normalize whitespace
- Preserve emojis for sentiment analysis

**REQ-DP-002**: System shall filter spam comments  
**Priority**: HIGH  
**Acceptance Criteria**:

- Detect common spam patterns
- Remove promotional comments
- Remove bot-generated comments
- Keep at least 70% of original comments

**REQ-DP-003**: System shall extract comment metadata  
**Priority**: MEDIUM  
**Acceptance Criteria**:

- Extract author name
- Extract like count
- Extract publish timestamp
- Extract reply count (if available)

### 3.3 Sentiment Analysis Module

**REQ-SA-001**: System shall classify comments into sentiment categories  
**Priority**: CRITICAL  
**Acceptance Criteria**:

- Three categories: Positive, Negative, Neutral
- Minimum 85% accuracy on test set
- Process 1000 comments in < 5 seconds
- Provide confidence scores

**REQ-SA-002**: System shall use hybrid approach  
**Priority**: HIGH  
**Acceptance Criteria**:

- VADER for high-confidence cases (fast)
- Ensemble ML for uncertain cases (accurate)
- Intelligent routing based on confidence threshold
- Log which model made each prediction

**REQ-SA-003**: System shall provide baseline comparison  
**Priority**: MEDIUM  
**Acceptance Criteria**:

- VADER baseline metrics
- TextBlob baseline metrics
- Custom model performance
- Side-by-side comparison table

### 3.4 Brand Monitoring Dashboard

**REQ-BM-001**: User shall input YouTube video URL  
**Priority**: CRITICAL  
**Acceptance Criteria**:

- Text input field
- URL validation
- Extract video ID automatically
- Show video thumbnail and title

**REQ-BM-002**: Dashboard shall display sentiment metrics  
**Priority**: CRITICAL  
**Acceptance Criteria**:

- Overall sentiment distribution (pie/bar chart)
- Total comment count
- Positive/Negative/Neutral percentages
- Average confidence score

**REQ-BM-003**: Dashboard shall show top comments  
**Priority**: HIGH  
**Acceptance Criteria**:

- Top 5 most positive comments
- Top 5 most negative comments
- Display with confidence scores
- Searchable/filterable

**REQ-BM-004**: Dashboard shall visualize sentiment trends  
**Priority**: MEDIUM  
**Acceptance Criteria**:

- Sentiment over time (if video > 1 month old)
- Word cloud of positive terms
- Word cloud of negative terms
- Engagement vs sentiment scatter plot

**REQ-BM-005**: User shall export results  
**Priority**: MEDIUM  
**Acceptance Criteria**:

- Export to CSV format
- Include all comments with sentiment labels
- Include summary statistics
- Download button in dashboard

### 3.5 Creator Analytics Dashboard

**REQ-CA-001**: Dashboard shall show video-level insights  
**Priority**: HIGH  
**Acceptance Criteria**:

- Video metadata (views, likes, comments)
- Sentiment breakdown
- Engagement rate
- Comment velocity (comments per hour)

**REQ-CA-002**: Dashboard shall identify key themes  
**Priority**: MEDIUM  
**Acceptance Criteria**:

- Most frequent keywords in positive comments
- Most frequent keywords in negative comments
- Topic clusters (if time permits)
- Actionable recommendations

**REQ-CA-003**: Dashboard shall compare multiple videos  
**Priority**: LOW (Nice to have)  
**Acceptance Criteria**:

- Select up to 3 videos
- Side-by-side sentiment comparison
- Identify best/worst performing videos
- Trend analysis

---

## 4. Non-Functional Requirements

### 4.1 Performance

- **NFR-P-001**: Process 1000 comments in < 5 seconds (90th percentile)
- **NFR-P-002**: Dashboard loads in < 3 seconds on standard broadband
- **NFR-P-003**: API response cache hit rate > 80%
- **NFR-P-004**: Model prediction time < 10ms per comment

### 4.2 Scalability

- **NFR-S-001**: Support concurrent analysis of 5 videos
- **NFR-S-002**: Handle videos with up to 10,000 comments
- **NFR-S-003**: Gracefully degrade when quota limit reached

### 4.3 Reliability

- **NFR-R-001**: 99% uptime during business hours (9am-5pm PST)
- **NFR-R-002**: Automatic retry on transient failures (max 3 attempts)
- **NFR-R-003**: Graceful error messages (no stack traces to user)

### 4.4 Usability

- **NFR-U-001**: Dashboard usable without training
- **NFR-U-002**: Mobile-responsive design
- **NFR-U-003**: Clear error messages and help text
- **NFR-U-004**: Accessible (WCAG 2.1 AA where possible)

### 4.5 Security

- **NFR-SEC-001**: No API keys in source code (use .env)
- **NFR-SEC-002**: No storage of YouTube user personal data
- **NFR-SEC-003**: Input validation on all user inputs
- **NFR-SEC-004**: HTTPS only in production

### 4.6 Maintainability

- **NFR-M-001**: Code coverage > 70% (unit tests)
- **NFR-M-002**: All functions documented with docstrings
- **NFR-M-003**: Modular architecture (separation of concerns)
- **NFR-M-004**: Clear README with setup instructions

---

## 5. Technical Specifications

### 5.1 Technology Stack

**Backend/Processing:**

- Python 3.9+
- google-api-python-client (YouTube API)
- pandas (data manipulation)
- scikit-learn (ML models)
- vaderSentiment (baseline)
- textblob (baseline)

**Frontend/Dashboard:**

- Streamlit 1.29+ (web framework)
- Plotly (interactive visualizations)
- WordCloud (text visualization)

**Infrastructure:**

- Streamlit Cloud (hosting)
- GitHub (version control)
- Local file system (caching)

### 5.2 System Architecture

```
┌─────────────────────────────────────────────────────┐
│                  User Interface                      │
│              (Streamlit Dashboard)                   │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│              Application Layer                       │
│  ┌──────────────┐  ┌──────────────┐                │
│  │ Brand Monitor│  │Creator       │                │
│  │ Controller   │  │Analytics     │                │
│  └──────────────┘  └──────────────┘                │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│              Business Logic Layer                    │
│  ┌──────────────┐  ┌──────────────┐ ┌─────────────┐│
│  │ YouTube API  │  │ Preprocessing│ │  Sentiment  ││
│  │ Wrapper      │  │ Pipeline     │ │  Analyzer   ││
│  └──────────────┘  └──────────────┘ └─────────────┘│
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│              Data Layer                              │
│  ┌──────────────┐  ┌──────────────┐ ┌─────────────┐│
│  │ Cache        │  │ Raw Data     │ │  Models     ││
│  │ Manager      │  │ Storage      │ │  Storage    ││
│  └──────────────┘  └──────────────┘ └─────────────┘│
└─────────────────────────────────────────────────────┘
```

### 5.3 Data Models

**Comment Object:**

```python
{
    "video_id": str,
    "comment_id": str,
    "text": str,
    "clean_text": str,
    "author": str,
    "likes": int,
    "published_at": datetime,
    "sentiment_label": str,  # positive/negative/neutral
    "sentiment_score": float,  # -1 to 1
    "confidence": float,  # 0 to 1
    "model_used": str,  # vader/ensemble/hybrid
    "is_spam": bool
}
```

**Video Metadata Object:**

```python
{
    "video_id": str,
    "title": str,
    "channel": str,
    "view_count": int,
    "like_count": int,
    "comment_count": int,
    "published_at": datetime,
    "thumbnail_url": str
}
```

**Analysis Result Object:**

```python
{
    "video_id": str,
    "analysis_date": datetime,
    "total_comments": int,
    "analyzed_comments": int,  # after spam removal
    "sentiment_distribution": {
        "positive": int,
        "negative": int,
        "neutral": int
    },
    "avg_confidence": float,
    "top_positive_comments": List[Comment],
    "top_negative_comments": List[Comment],
    "keywords_positive": List[str],
    "keywords_negative": List[str]
}
```

### 5.4 API Specifications

**YouTube Data API v3 Endpoints Used:**

1. **commentThreads.list**

   - Purpose: Fetch video comments
   - Cost: 1 unit per request
   - Max results per request: 100
   - Pagination: nextPageToken

2. **videos.list**
   - Purpose: Fetch video metadata
   - Cost: 1 unit per request
   - Parts needed: snippet, statistics

### 5.5 File Structure

```
youtube-sentiment-intelligence/
├── .env                          # API keys (NOT in git)
├── .env.example                  # Template for .env
├── .gitignore                    # Git ignore file
├── requirements.txt              # Python dependencies
├── README.md                     # Project documentation
├── BRD.md                        # This document
├── TECHNICAL_SPEC.md             # Technical details
│
├── data/
│   ├── raw/                      # Cached API responses
│   │   └── {video_id}_comments.json
│   ├── processed/                # Cleaned datasets
│   │   ├── train_data.csv
│   │   └── test_data.csv
│   └── models/                   # Saved ML models
│       ├── vectorizer.pkl
│       └── ensemble_model.pkl
│
├── src/
│   ├── __init__.py
│   ├── config.py                 # Configuration settings
│   ├── youtube_api.py            # API wrapper
│   ├── preprocessing.py          # Text cleaning
│   ├── feature_engineering.py    # Feature extraction
│   ├── sentiment_analysis.py     # Baseline models
│   ├── model_training.py         # Custom ML models
│   ├── ensemble_model.py         # Ensemble logic
│   ├── hybrid_analyzer.py        # Hybrid routing
│   └── utils.py                  # Helper functions
│
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   ├── 02_baseline_models.ipynb
│   ├── 03_model_training.ipynb
│   └── 04_model_comparison.ipynb
│
├── app/
│   ├── streamlit_app.py          # Main dashboard
│   ├── visualizations.py         # Chart functions
│   └── labeling_tool.py          # Manual labeling
│
└── tests/
    ├── test_preprocessing.py
    ├── test_youtube_api.py
    └── test_sentiment_analysis.py
```

---

## 6. Development Phases & Timeline

### Phase 1: Foundation (Week 1)

**Days 1-7**: Data Pipeline & Baseline Models

**Key Deliverables:**

- Working YouTube API integration
- Comment fetching with caching
- Text preprocessing pipeline
- VADER + TextBlob baseline
- 500-1000 labeled comments

**Definition of Done:**

- [ ] Can fetch 1000 comments for any video
- [ ] Comments are cached and reusable
- [ ] Text is cleaned and spam-free
- [ ] Baseline sentiment works with 70%+ accuracy
- [ ] Training data created and split

### Phase 2: Intelligence (Week 2)

**Days 8-14**: Custom ML Models & Ensemble

**Key Deliverables:**

- Trained Logistic Regression model
- Trained Random Forest model
- Trained Gradient Boosting model
- Ensemble voting classifier
- Hybrid intelligent router
- Model comparison analysis

**Definition of Done:**

- [ ] All models trained on labeled data
- [ ] Ensemble outperforms baseline by 10%+
- [ ] Hybrid router implemented
- [ ] Models saved and loadable
- [ ] Performance metrics documented

### Phase 3: Production (Week 3)

**Days 15-21**: Dashboard & Deployment

**Key Deliverables:**

- Streamlit dashboard with 2 modes
- Brand monitoring interface
- Creator analytics interface
- Data visualizations (5+ charts)
- Export to CSV functionality
- Deployed to Streamlit Cloud
- Complete documentation

**Definition of Done:**

- [ ] Dashboard loads without errors
- [ ] Can analyze any YouTube video
- [ ] Both modes functional
- [ ] Deployed and publicly accessible
- [ ] README complete with screenshots
- [ ] Demo video created

---

## 7. Risk Management

### 7.1 Technical Risks

**RISK-001: API Quota Exhaustion**

- Probability: HIGH
- Impact: HIGH
- Mitigation: Aggressive caching, quota monitoring, graceful degradation
- Contingency: Use cached data only, add "refresh" delay

**RISK-002: Low Model Accuracy**

- Probability: MEDIUM
- Impact: MEDIUM
- Mitigation: Start with proven baseline (VADER), ensemble multiple models
- Contingency: Document limitations, focus on insights not perfect accuracy

**RISK-003: Deployment Issues**

- Probability: MEDIUM
- Impact: MEDIUM
- Mitigation: Test locally first, use proven platform (Streamlit Cloud)
- Contingency: Provide local setup instructions, video demo

**RISK-004: Timeline Slippage**

- Probability: MEDIUM
- Impact: LOW
- Mitigation: Buffer days built-in, prioritize must-haves
- Contingency: Cut nice-to-have features, ship MVP

### 7.2 Data Risks

**RISK-005: Insufficient Labeled Data**

- Probability: LOW
- Impact: MEDIUM
- Mitigation: Use baseline to pre-label, only verify 500 samples
- Contingency: Use VADER as final model, document limitation

**RISK-006: Comments Disabled**

- Probability: LOW
- Impact: LOW
- Mitigation: Handle gracefully with user-friendly message
- Contingency: Provide example video IDs that work

---

## 8. Success Criteria & KPIs

### 8.1 Technical KPIs

| Metric              | Target                 | Measurement Method |
| ------------------- | ---------------------- | ------------------ |
| Sentiment Accuracy  | ≥ 85%                  | Test set F1-score  |
| Processing Speed    | < 5s for 1000 comments | Timer in dashboard |
| API Quota Usage     | < 1000 units/day       | Monitoring logs    |
| Cache Hit Rate      | ≥ 80%                  | Cache statistics   |
| Dashboard Load Time | < 3 seconds            | Browser dev tools  |
| Code Coverage       | ≥ 70%                  | pytest-cov         |

### 8.2 Business KPIs

| Metric              | Target           | Measurement Method |
| ------------------- | ---------------- | ------------------ |
| Time Savings        | 99% vs manual    | Benchmark test     |
| User Satisfaction   | N/A (portfolio)  | Self-assessment    |
| Interview Callbacks | 3-5x improvement | Track applications |
| GitHub Stars        | ≥ 10             | GitHub stats       |

### 8.3 Portfolio KPIs

| Metric       | Target            | Measurement Method |
| ------------ | ----------------- | ------------------ |
| Code Quality | Clean, documented | Code review        |
| Completeness | All phases done   | Checklist          |
| Presentation | Professional      | Peer review        |
| Uniqueness   | Differentiated    | Compare to others  |

---

## 9. Acceptance Criteria

### 9.1 Functional Acceptance

**The project is complete when:**

- [ ] User can paste any YouTube URL and get sentiment analysis
- [ ] Dashboard displays accurate sentiment distribution
- [ ] Both Brand and Creator modes are functional
- [ ] Results can be exported to CSV
- [ ] Application is deployed and publicly accessible
- [ ] All critical bugs are resolved

### 9.2 Quality Acceptance

**The project meets quality standards when:**

- [ ] Code is well-structured and modular
- [ ] All major functions have docstrings
- [ ] No hardcoded credentials
- [ ] Error handling on all external calls
- [ ] README is comprehensive
- [ ] At least 3 unit tests pass

### 9.3 Portfolio Acceptance

**The project is portfolio-ready when:**

- [ ] GitHub repo has professional README
- [ ] Live demo URL is working
- [ ] Demo video/GIF created
- [ ] Can explain project for 30+ minutes
- [ ] Identified 3 key learnings
- [ ] Documented challenges overcome

---

## 10. Sign-Off

### Stakeholder Approval

**Project Scope Approved By:**

| Role           | Name            | Date         | Signature |
| -------------- | --------------- | ------------ | --------- |
| Product Owner  | You (Student)   | Oct 15, 2025 | ✅        |
| Technical Lead | You (Developer) | Oct 15, 2025 | ✅        |
| QA Lead        | You (Tester)    | Oct 15, 2025 | ✅        |

**Status**: APPROVED - Ready to begin development

**Next Steps**:

1. Set up development environment (Day 1)
2. Create GitHub repository
3. Initialize project structure
4. Begin Phase 1 development

---

## Appendix A: Glossary

- **API**: Application Programming Interface
- **BRD**: Business Requirements Document
- **Ensemble**: Combining multiple ML models
- **F1-Score**: Harmonic mean of precision and recall
- **KPI**: Key Performance Indicator
- **ML**: Machine Learning
- **MVP**: Minimum Viable Product
- **NLP**: Natural Language Processing
- **Sentiment Analysis**: Determining emotional tone of text
- **VADER**: Valence Aware Dictionary and sEntiment Reasoner
- **TF-IDF**: Term Frequency-Inverse Document Frequency

---

## Appendix B: References

1. YouTube Data API v3 Documentation: https://developers.google.com/youtube/v3
2. VADER Sentiment Paper: Hutto & Gilbert (2014)
3. Streamlit Documentation: https://docs.streamlit.io
4. Scikit-learn Documentation: https://scikit-learn.org

---

**Document Control:**

- Version: 1.0
- Last Updated: October 15, 2025
- Next Review: End of Week 1
- Owner: Project Developer
- Classification: Public
