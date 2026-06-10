import { Injectable, Logger } from '@nestjs/common';

@Injectable()
export class MailService {
  private readonly logger = new Logger(MailService.name);

  async sendWeeklyReport(parentEmail: string, childName: string, dashboardData: any) {
    // In production, use nodemailer with real SMTP
    // For MVP, just log the report
    this.logger.log(`📧 Weekly report for ${childName} sent to ${parentEmail}`);

    const report = {
      to: parentEmail,
      subject: `📊 Reporte semanal de ${childName} - WonderLearn`,
      html: this.generateReportHtml(childName, dashboardData),
    };

    // TODO: Integrate with SMTP when ready
    // await this.transporter.sendMail(report);

    return report;
  }

  private generateReportHtml(childName: string, data: any): string {
    return `
      <!DOCTYPE html>
      <html>
      <head>
        <style>
          body { font-family: Arial, sans-serif; background: #FFF8E1; padding: 20px; }
          .container { max-width: 600px; margin: 0 auto; background: white; border-radius: 16px; padding: 30px; }
          .header { text-align: center; margin-bottom: 30px; }
          .header h1 { color: #FFD93D; font-size: 28px; }
          .stat-card { background: #F5F5F5; border-radius: 12px; padding: 15px; margin: 10px 0; }
          .stat-label { color: #666; font-size: 14px; }
          .stat-value { color: #4A4A4A; font-size: 24px; font-weight: bold; }
          .skills { display: flex; gap: 10px; margin: 20px 0; }
          .skill-bar { flex: 1; background: #EEE; border-radius: 8px; height: 20px; overflow: hidden; }
          .skill-fill { height: 100%; border-radius: 8px; }
          .footer { text-align: center; color: #999; font-size: 12px; margin-top: 30px; }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1>🌟 Reporte de ${childName}</h1>
            <p>Semana del ${new Date().toLocaleDateString('es-ES')}</p>
          </div>
          
          <div class="stat-card">
            <div class="stat-label">Tiempo total esta semana</div>
            <div class="stat-value">${data.weeklyStats.thisWeekMinutes} minutos</div>
            ${data.weeklyStats.changePercent !== 0 ? `
              <div style="color: ${data.weeklyStats.changePercent > 0 ? '#6BCB77' : '#FF6B6B'}">
                ${data.weeklyStats.changePercent > 0 ? '↑' : '↓'} ${Math.abs(data.weeklyStats.changePercent)}% vs semana anterior
              </div>
            ` : ''}
          </div>

          <div class="stat-card">
            <div class="stat-label">Lecciones completadas hoy</div>
            <div class="stat-value">${data.todayStats.lessonsCompleted}</div>
          </div>

          <h3>🎯 Habilidades</h3>
          <div class="skills">
            <div>
              <div style="font-size: 12px; color: #666;">Lectura</div>
              <div class="skill-bar">
                <div class="skill-fill" style="width: ${data.skills.phonics}%; background: #FFD93D;"></div>
              </div>
            </div>
            <div>
              <div style="font-size: 12px; color: #666;">Matemáticas</div>
              <div class="skill-bar">
                <div class="skill-fill" style="width: ${data.skills.math}%; background: #6BCB77;"></div>
              </div>
            </div>
            <div>
              <div style="font-size: 12px; color: #666;">Emociones</div>
              <div class="skill-bar">
                <div class="skill-fill" style="width: ${data.skills.sel}%; background: #FF6B6B;"></div>
              </div>
            </div>
          </div>

          ${data.badges.length > 0 ? `
            <h3>🏅 Insignias recientes</h3>
            <div style="display: flex; gap: 10px; flex-wrap: wrap;">
              ${data.badges.slice(0, 3).map((b: any) => `
                <div style="background: #F5F5F5; padding: 10px; border-radius: 8px; text-align: center;">
                  <div style="font-size: 24px;">🏆</div>
                  <div style="font-size: 12px;">${b.title}</div>
                </div>
              `).join('')}
            </div>
          ` : ''}

          <div class="footer">
            <p>💡 Sugerencia: Practica contar objetos en casa para reforzar las matemáticas</p>
            <p>WonderLearn - Aprendizaje sin límites</p>
          </div>
        </div>
      </body>
      </html>
    `;
  }
}
