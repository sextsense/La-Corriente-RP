var visable = false;

$(function () {
	window.addEventListener('message', function (event) {
		switch (event.data.action) {
			
			case 'updatePlayerJobs':
				var jobs = event.data.jobs;
				$('#ems').html(jobs.ems);
				$('#police').html(jobs.police);
				$('#sheriff').html(jobs.sheriff);
				$('#taxi').html(jobs.taxi);
				$('#mechanic').html(jobs.mechanic);
				$('#lawyer').html(jobs.lawyer);
				break;

			default:
				console.log('pk_onlinejobs: unknown action!');
				break;
		}
	}, false);
});
