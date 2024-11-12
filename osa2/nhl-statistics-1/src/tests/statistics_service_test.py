import unittest
from statistics_service import StatisticsService
from player import Player

class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri",   "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatisticsService(unittest.TestCase):
    def setUp(self):
        self.stub = PlayerReaderStub()
        self.service = StatisticsService(self.stub)

    def test_huono_haku(self):
        self.assertEqual(self.service.search("test"), None)

    def test_hyva_haku(self):
        self.assertEqual(self.service.search("Gretzky").name, "Gretzky")

    def test_tiimi(self):
        self.assertEqual(self.service.team("DET")[0].name, "Yzerman")

    def test_paras(self):
        self.assertEqual(self.service.top(1)[0].name, "Gretzky")