export const APP_NAME = 'WonderLearn';
export const APP_VERSION = '1.0.0';

export const MODULES = {
  WONDERBOOKS: 'wonderbooks',
  WONDERMATH: 'wondermath',
  WONDERGROW: 'wondergrow',
} as const;

export const AVATARS = {
  DRAGON: 'dragon',
  CAT: 'cat',
  ROBOT: 'robot',
} as const;

export const SKILL_MASTERY = {
  NOVICE: 'novice',
  DEVELOPING: 'developing',
  PROFICIENT: 'proficient',
  MASTERED: 'mastered',
} as const;

export const LESSON_STATUS = {
  STARTED: 'started',
  COMPLETED: 'completed',
  ABANDONED: 'abandoned',
} as const;

export const ADAPTIVE_RULES = {
  CONSECUTIVE_SUCCESS_TO_INCREASE: 3,
  CONSECUTIVE_FAILURE_TO_DECREASE: 3,
  FRUSTRATION_ERROR_THRESHOLD: 5,
  FRUSTRATION_TIME_WINDOW_MS: 120000, // 2 minutes
  RANDOM_TOUCH_THRESHOLD: 5,
  RANDOM_TOUCH_TIME_WINDOW_MS: 10000, // 10 seconds
  MINDFULNESS_SUGGESTION_MINUTES: 15,
} as const;
