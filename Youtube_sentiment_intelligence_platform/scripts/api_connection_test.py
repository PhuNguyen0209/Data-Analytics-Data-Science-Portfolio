"""
Quick test to verify YouTube API connection works
"""

from googleapiclient.discovery import build
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()

def test_api_connection():
    """Test that we can connect to YouTube API"""
    
    print("\n" + "="*60)
    print("🔑 Testing YouTube API Connection")
    print("="*60 + "\n")
    
    api_key = os.getenv('YOUTUBE_API_KEY')
    
    if not api_key:
        print("❌ No API key found in .env file")
        print("   Please check your .env file has:")
        print("   YOUTUBE_API_KEY=your_key_here")
        return False
    
    print(f"✅ API key loaded (length: {len(api_key)} chars)")
    
    try:
        # Build YouTube API client
        youtube = build('youtube', 'v3', developerKey=api_key)
        
        print(" YouTube API client created")
        
        # Make a simple test request
        # Using Rick Astley's "Never Gonna Give You Up" - always available
        print("\n📡 Testing with sample video...")
        request = youtube.videos().list(
            part='snippet,statistics',
            id='dQw4w9WgXcQ'
        )
        
        response = request.execute()
        
        if response['items']:
            video = response['items'][0]
            print("\n API CONNECTION SUCCESSFUL!")
            print(f"\n Test Video Info:")
            print(f"   Title: {video['snippet']['title']}")
            print(f"   Channel: {video['snippet']['channelTitle']}")
            print(f"   Views: {int(video['statistics']['viewCount']):,}")
            print(f"   Likes: {int(video['statistics']['likeCount']):,}")
            print(f"   Comments: {int(video['statistics']['commentCount']):,}")
            print("\n" + "="*60)
            print("Your API key is working perfectly!")
            print("="*60 + "\n")
            return True
        else:
            print("API key works but no video found")
            return False
            
    except Exception as e:
        print(f"\n API connection failed!")
        print(f"   Error: {e}")
        print("\n Possible issues:")
        print("   1. API key is invalid")
        print("   2. YouTube Data API v3 is not enabled")
        print("   3. Network connection issue")
        print("   4. API quota exceeded")
        return False

if __name__ == "__main__":
    success = test_api_connection()
    
    if success:
        print("✅ Ready to proceed with Day 2!")
    else:
        print("❌ Please fix the issues above before continuing")