import os
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# ============================================================================
# API CONFIGURATION
# ============================================================================

YOUTUBE_API_KEY = os.getenv('YOUTUBE_API_KEY')

# API Quota Management
API_QUOTA_LIMIT = 10000  # Daily limit for free tier
COMMENTS_PER_REQUEST = 100  # Max comments per API call
MAX_COMMENTS_PER_VIDEO = int(os.getenv('MAX_COMMENTS', 1000))

# ============================================================================
# PATH CONFIGURATION
# ============================================================================

# Project root directory
PROJECT_ROOT = Path(__file__).parent.parent

# Data directories
DATA_DIR = PROJECT_ROOT / 'data'
RAW_DATA_DIR = DATA_DIR / 'raw'
PROCESSED_DATA_DIR = DATA_DIR / 'processed'
MODELS_DIR = DATA_DIR / 'models'

# Ensure directories exist
RAW_DATA_DIR.mkdir(parents=True, exist_ok=True)
PROCESSED_DATA_DIR.mkdir(parents=True, exist_ok=True)
MODELS_DIR.mkdir(parents=True, exist_ok=True)

# ============================================================================
# CACHING CONFIGURATION
# ============================================================================

CACHE_ENABLED = True
CACHE_EXPIRY_DAYS = int(os.getenv('CACHE_EXPIRY_DAYS', 7))

# ============================================================================
# MODEL CONFIGURATION
# ============================================================================

# Sentiment thresholds
SENTIMENT_THRESHOLDS = {
    'positive': 0.05,   # Compound score >= 0.05 = positive
    'negative': -0.05,  # Compound score <= -0.05 = negative
}

# Model confidence thresholds
HIGH_CONFIDENCE_THRESHOLD = 0.8
LOW_CONFIDENCE_THRESHOLD = 0.5

# ============================================================================
# PREPROCESSING CONFIGURATION
# ============================================================================

# Spam keywords (case-insensitive)
SPAM_KEYWORDS = [
    'subscribe to my channel',
    'check out my',
    'free download',
    'click here',
    'like and subscribe',
]

# Minimum comment length (words)
MIN_COMMENT_LENGTH = 3

# ============================================================================
# DASHBOARD CONFIGURATION
# ============================================================================

PAGE_TITLE = "YouTube Sentiment Intelligence"
PAGE_ICON = "📊"
LAYOUT = "wide"

# Chart colors
SENTIMENT_COLORS = {
    'positive': '#28a745',
    'negative': '#dc3545',
    'neutral': '#ffc107',
}

# ============================================================================
# VALIDATION
# ============================================================================

def validate_config():
    """Validate that all required configuration is set"""
    
    errors = []
    
    # Check API key
    if not YOUTUBE_API_KEY:
        errors.append("YOUTUBE_API_KEY not set in .env file")
    
    # Check paths exist
    if not PROJECT_ROOT.exists():
        errors.append(f"Project root not found: {PROJECT_ROOT}")
    
    if errors:
        print("Configuration errors:")
        for error in errors:
            print(f"   - {error}")
        return False
    
    print("Configuration validated successfully")
    return True


if __name__ == "__main__":
    # Test configuration
    print("Testing configuration...")
    print(f"Project root: {PROJECT_ROOT}")
    print(f"API key set: {'Yes' if YOUTUBE_API_KEY else 'No'}")
    print(f"Cache enabled: {CACHE_ENABLED}")
    print(f"Cache expiry: {CACHE_EXPIRY_DAYS} days")
    print()
    validate_config()