import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '15s', target: 600 },
    { duration: '5m', target: 1100 },
    { duration: '5s', target: 50 },
  ],
  thresholds: {
    http_req_duration: ['p(95)<15000'],
  },
};

const keywords = ['linux', 'docker', 'python', 'searxng', 'github', 'rust'];

export default function () {
  const keyword = keywords[Math.floor(Math.random() * keywords.length)];
  const url = `http://192.168.3.70:8888/search?q=${encodeURIComponent(keyword)}`;

  const res = http.get(url);
  check(res, {
    'is status 200': (r) => r.status === 200,
  });

  sleep(0.3);
}
