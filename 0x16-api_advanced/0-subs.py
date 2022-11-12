#!/usr/bin/python3
"""
Defines a function that queries Reddit API
"""
import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of
    subscribers (not active users, total subscribers) for a given subreddit
    """
    subscribers = 0
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    headers = {'User-Agent': 'advanced-api/0.0.1 by Mendy'}
    req = requests.get(url=url, headers=headers, allow_redirects=False)
    if req.status_code == 200:
        response = req.json()
        subscribers = response['data']['subscribers']
    return subscribers
