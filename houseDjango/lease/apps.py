from django.apps import AppConfig
from apscheduler.schedulers.blocking import BlockingScheduler
from .views import update_lease_status

import time


class LeaseConfig(AppConfig):
    name = 'lease'

    def ready(self):
        print(1111)
        # time.sleep(5)
        # scheduler = BlockingScheduler()
        # scheduler.add_job(update_lease_status, 'interval', seconds=1, id='updateLeaseStatus')
        # scheduler.start()
